//
//  RouteOverlay.swift
//  SiriusMap
//
//  Created by Egor on 24.03.2024.
//

import MapKit

struct Route {
    let eta: Double
    let path: [MapItem]
}

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate {
    var clCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

final class RouteOverlay: NSObject, MKOverlay {
    
    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    let boundingMapRect: MKMapRect = .world
    
    init(path: [MapItem]) {
        guard 
            let routeStart = path.first,
            let routeEnd = path.last
        else {
            fatalError("Empty path")
        }
        
        routeStartAnnotation = RouteStartAnnotation(
            coordinate: routeStart.coordinate.clCoordinate,
            title: routeStart.title
        )
        routeEndAnnotation = RouteEndAnnotation(
            coordinate: routeEnd.coordinate.clCoordinate,
            title: routeEnd.title
        )
        locations = path.map { $0.coordinate.clCoordinate }
    }
    
    let locations: [CLLocationCoordinate2D]
    let routeStartAnnotation: RouteStartAnnotation
    let routeEndAnnotation: RouteEndAnnotation
}
