//
//  RouteOverlay.swift
//  SiriusMap
//
//  Created by Egor on 24.03.2024.
//

import MapKit

final class Route: NSObject, MKOverlay {
    
    let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    let boundingMapRect: MKMapRect = .world
    
    var locations: [CLLocation] = []
}
