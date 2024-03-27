//
//  RouteComponents.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 27.03.2024.
//

import Foundation
import MapKit

// MARK: - Components

struct Anchor: Decodable {
    let id: Int
    let coordinates: [Double]
    let title: String?
    
    var mapItem: MapItem {
        MapItem (
            id: id,
            title: title,
            coordinate: Coordinate(
                latitude: coordinates[0],
                longitude: coordinates[1]
            )
        )
    }
}

struct MapItem {
    let id: Int
    let title: String?
    let coordinate: Coordinate
}

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

struct Route {
    let path: [MapItem]
    let eta: Double
}

struct Graph {
    let mapItems: [MapItem]
    let edges: [Int : [Int]]
}

// MARK: - Extensions

extension Coordinate {
    var clCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
