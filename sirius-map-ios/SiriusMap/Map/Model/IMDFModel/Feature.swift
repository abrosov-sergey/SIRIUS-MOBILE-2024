//
//  Feature.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit

class Feature: NSObject, IMDFDecodable {
    let identifier: UUID
    let geometry: [MKShape & MKGeoJSONObject]
    let properties: Occupant.Properties?

    required init(feature: MKGeoJSONFeature, shouldParseProperties: Bool) throws {
        guard let uuidString = feature.identifier else {
            throw IMDFError.missingIdentifier
        }

        if let identifier = UUID(uuidString: uuidString) {
            self.identifier = identifier
        } else {
            throw IMDFError.invalidIdentifier
        }

        geometry = feature.geometry

        if shouldParseProperties, let propertiesData = feature.properties {
            properties = try JSONDecoder().decode(Occupant.Properties.self, from: propertiesData)
        } else {
            properties = nil
        }
    }
}
