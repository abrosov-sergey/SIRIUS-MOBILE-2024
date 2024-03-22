//
//  MapItem.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

struct MapItem {
    let name: String
}

#if DEBUG
extension MapItem {
    static let sampleData = [
        "Вход", "Финтех ЦИТ", "Умный город", "Ресторан Вега", "Библиотека", "Туалет",
        "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110"
    ].map(MapItem.init)
}
#endif
