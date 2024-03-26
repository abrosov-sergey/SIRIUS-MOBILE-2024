//
//  RouteView.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 26.03.2024.
//

import SwiftUI

struct RouteView: View {
    
    @State private var listItems = ["Сюда", "Отсюда"]
    
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
                Section {
                    HStack {
                        VStack {
                            Text("5 минут")
                                .font(.title)
                            Text("400 метров")
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("GO")
                                .foregroundStyle(.white)
                                .padding(20)
                                .background(RoundedRectangle(cornerRadius: 10))
                                .foregroundStyle(.green)
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                EditButton()
            }.environment(\.editMode, .constant(.active))
        }
    }
}

#Preview {
    RouteView()
}
