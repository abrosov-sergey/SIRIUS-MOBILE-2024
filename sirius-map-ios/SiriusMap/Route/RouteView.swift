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

    private enum ListItemType {
        case start
        case end
    }

    private struct ListItem {
        let type: ListItemType
        var title: String?
        let iconName: String
    }

    @State private var listItems: [ListItem]

    private let actions: Actions

    init(_ endPoint: MapItem, actions: Actions) {
        self.actions = actions

        listItems = [
            ListItem(
                type: .start,
                title: nil,
                iconName: "location.fill"
            ),
            ListItem(
                type: .end,
                title: endPoint.title,
                iconName: "figure.walk.motion"
            ),
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
                            Image(systemName: item.iconName)
                                .foregroundStyle(item.type == .start ? .blue : .green)
                            Text(item.title ?? "")
                                .foregroundStyle(.black)
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .onMove { from, to in
                    listItems.move(fromOffsets: from, toOffset: to)
                    actions.onChangeRoute()
                }
            }
            .toolbar {
                EditButton()
            }.environment(\.editMode, .constant(.active))
        }
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
