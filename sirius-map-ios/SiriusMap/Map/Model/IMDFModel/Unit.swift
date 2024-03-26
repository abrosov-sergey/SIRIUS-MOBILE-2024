//
//  Unit.swift
//  SiriusMap
//
//  Created by Egor on 23.03.2024.
//

import MapKit

final class Unit: Feature{
    //var coordinate = CLLocationCoordinate2D(latitude: 43.41456934283174, longitude: 39.951161916378858)
    
    var title: String? = "Финтех ЦИТ"
}

extension Unit: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 43.41456934283174, longitude: 39.951161916378858)
    }
}
