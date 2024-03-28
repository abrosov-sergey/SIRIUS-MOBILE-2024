//
//  RouteView.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 26.03.2024.
//

import SwiftUI

class ItemsArray: ObservableObject {
    @Published var array: [ListItem] = []
}

enum ListItemType: String {
    case start = "location.fill"
    case end = "figure.walk.motion"
}

struct ListItem {
    var type: ListItemType
    var title: String?
}

struct RouteView: View {
    struct Actions {
        var onTapStartCell: () -> Void
        var onTapEndCell: () -> Void
        var onChangeRoute: () -> Void

        static let empty = Actions(
            onTapStartCell: { print("onTapStartCell") },
            onTapEndCell: { print("onTapEndCell") },
            onChangeRoute: { print("onChangeRoute") }
        )
    }

    @ObservedObject var listItems = ItemsArray()

    private let actions: Actions

    init(_ endPoint: MapItem, actions: Actions) {
        self.actions = actions

        listItems.array = [
            ListItem(
                type: .start,
                title: nil
            ),
            ListItem(
                type: .end,
                title: endPoint.title
            ),
        ]
    }

    var body: some View {
        VStack {
            List {
                ForEach(listItems.array, id: \.type.hashValue) { item in

                    Button {
                        switch item.type {
                        case .start:
                            actions.onTapStartCell()
                        case .end:
                            actions.onTapEndCell()
                        }
                    } label: {
                        HStack {
                            Image(systemName: item.type.rawValue)
                                .foregroundStyle(item.type == .start ? .blue : .green)
                            Text(item.title ?? "Откуда")
                                .foregroundStyle(
                                    item.title != nil ? Color(
                                        UIColor.label
                                    ) : Color(
                                        UIColor.tertiaryLabel
                                    )
                                )
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .onMove { _, _ in
                    listItems.array = swapListItems(listItems.array)
                    actions.onChangeRoute()
                }
            }
            .toolbar {
                EditButton()
            }.environment(\.editMode, .constant(.active))
            Spacer()
        }
    }

    func setRouteStart(_ start: MapItem) {
        guard listItems.array.count == 2 else { return }

        let newItems = [
            ListItem(
                type: .start,
                title: start.title
            ),
            ListItem(
                type: .end,
                title: listItems.array[1].title
            ),
        ]

        listItems.array = newItems
    }

    func setRouteEnd(_ end: MapItem) {
        guard listItems.array.count == 2 else { return }

        listItems.array = [
            ListItem(
                type: .start,
                title: listItems.array[0].title
            ),
            ListItem(
                type: .end,
                title: end.title
            ),
        ]
    }
}

private func swapListItems(_ list: [ListItem]) -> [ListItem] {
    guard list.count == 2 else { return list }
    return [
        ListItem(
            type: list[0].type,
            title: list[1].title
        ),
        ListItem(
            type: list[1].type,
            title: list[0].title
        ),
    ]
}

#Preview {
    RouteView(
        MapItem(
            id: 1,
            title: "Выход",
            coordinate: Coordinate(latitude: 1.0, longitude: 1.0)
        ), actions: .empty
    )
}
