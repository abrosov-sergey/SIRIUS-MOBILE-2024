//
//  RouteEndAnnotation.swift
//  SiriusMap
//
//  Created by Egor on 25.03.2024.
//

import MapKit

final class RouteEndAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String? = "Конец маршрута"

    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}

final class RouteStartAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String? = "Начало маршрута"

    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}
