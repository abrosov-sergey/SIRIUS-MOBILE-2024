//
//  MockPathBuilder.swift
//  SiriusMap
//
//  Created by Egor on 27.03.2024.
//

struct MockPathBuilder: PathBuilderProtocol {
    func route(start _: MapItem, end _: MapItem) -> Route {
        Route(path: MapItem.sampleData.reversed(), eta: 3.0)
    }
}
