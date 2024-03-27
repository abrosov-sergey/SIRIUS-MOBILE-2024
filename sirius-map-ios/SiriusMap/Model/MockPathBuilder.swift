//
//  MockPathBuilder.swift
//  SiriusMap
//
//  Created by Egor on 27.03.2024.
//

struct MockPathBuilder: PathBuilderProtocol {
    func route(start: MapItem, end: MapItem) -> Route {
        return Route(path: MapItem.sampleData.reversed(), eta: 3.0)
    }
}
