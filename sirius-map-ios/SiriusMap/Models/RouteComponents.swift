//
//  RouteComponents.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 27.03.2024.
//

import Foundation
import MapKit

// MARK: - Components

public struct Anchor: Decodable {
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

public struct MapItem {
    let id: Int
    let title: String?
    let coordinate: Coordinate
}

public struct Coordinate {
    let latitude: Double
    let longitude: Double
}

public struct Route {
    let path: [MapItem]
    let eta: Double
}

public struct Graph {
    let mapItems: [MapItem]
    let edges: [Int : [Int]]
}

struct PointDistance: Comparable {
    static func < (lhs: PointDistance, rhs: PointDistance) -> Bool {
        return lhs.distance < rhs.distance
    }
    let distance: Double
    let index: Int
}

// MARK: - Extensions

public extension Coordinate {
    var clCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
