//
//  PathBuilderProtocol.swift
//  SiriusMap
//
//  Created by Egor on 27.03.2024.
//

protocol PathBuilderProtocol {
    func route(start: MapItem, end: MapItem) -> Route
}
