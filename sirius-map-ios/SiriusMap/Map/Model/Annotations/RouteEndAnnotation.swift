//
//  Annotation.swift
//  SiriusMap
//
//  Created by Egor on 25.03.2024.
//

import MapKit

final class RouteEndAnnotation: NSObject, MKAnnotation {
    var coordinate = kCLLocationCoordinate2DInvalid
    var title: String?
    var subtitle: String? = "Конец маршрута"
}
