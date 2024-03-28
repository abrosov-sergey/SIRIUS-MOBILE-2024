//
//  MockPathBuilder.swift
//  SiriusMap
//
//  Created by Egor on 27.03.2024.
//

struct MockPathBuilder: PathBuilderProtocol {
    func route(start _: MapItem, end _: MapItem) -> Route {
        Route(eta: 3.0, path: MapItem.sampleData.reversed())
    }
}
