//
//  RouteView.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 26.03.2024.
//

import SwiftUI

struct RouteView: View {
    
    @State private var listItems: [String]
    
    init(from: String, to: String) {
        listItems = [from, to]
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(listItems, id: \.self) { item in
                    HStack {
                        Image(systemName: "location.circle.fill")
                            .foregroundStyle(.blue)
                        Text(item)
                    }
                }
                .onMove { from, to in
                    listItems.move(fromOffsets: from, toOffset: to)
                }
            }
            .toolbar {
                EditButton()
            }.environment(\.editMode, .constant(.active))
        }
    }
}

#Preview {
    RouteView(from: "Туалет", to: "Вход")
}
