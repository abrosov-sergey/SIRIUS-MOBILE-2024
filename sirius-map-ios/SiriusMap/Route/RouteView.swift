//
//  RouteView.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 26.03.2024.
//

import SwiftUI

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
    
    private enum ListItemType: String {
        case start = "location.fill"
        case end = "figure.walk.motion"
    }

    private struct ListItem {
        var type: ListItemType
        var title: String?
    }

    @State private var listItems: [ListItem]

    private let actions: Actions

    init(_ endPoint: MapItem, actions: Actions) {
        self.actions = actions

        listItems = [
            ListItem(
                type: .start,
                title: nil
            ),
            ListItem(
                type: .end,
                title: endPoint.title
            )
        ]
    }

    var body: some View {
        VStack {
            List {
                ForEach(listItems, id: \.type.hashValue) { item in

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
                            Text(item.title ?? "")
                                .foregroundStyle(.black)
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .onMove { from, to in
                    listItems = swapListItems(listItems)
                    actions.onChangeRoute()
                }
            }
            .toolbar {
                EditButton()
            }.environment(\.editMode, .constant(.active))
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
            )
        ]
    }

    func setRouteStart(_ start: MapItem) {
        listItems[0].title = start.title
    }

    func setRouteEnd(_ end: MapItem) {
        listItems[0].title = end.title
    }
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
