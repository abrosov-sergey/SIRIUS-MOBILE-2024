//
//  Feature.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit

class Feature: IMDFDecodable {
    let identifier: UUID
    let geometry: [MKShape & MKGeoJSONObject]
    
    required init(feature: MKGeoJSONFeature) throws {
        guard let uuidString = feature.identifier else {
            throw IMDFError.missingIdentifier
        }
        
        if let identifier = UUID(uuidString: uuidString) {
            self.identifier = identifier
        } else {
            throw IMDFError.invalidIdentifier
        }
        
        self.geometry = feature.geometry
    }
}