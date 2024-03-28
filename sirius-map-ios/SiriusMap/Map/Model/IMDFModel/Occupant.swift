//
//  Occupant.swift
//  SiriusMap
//
//  Created by Egor on 28.03.2024.
//

import MapKit

final class Occupant: Feature {
    struct Properties: Decodable {
        let name: String
    }

    var coordinate: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid
    var title: String?
}

extension Occupant: MKAnnotation {}
