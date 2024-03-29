//
//  IMDFDecoder.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit

enum IMDFError: Error {
    case invalidData
    case invalidIdentifier
    case invalidType
    case invalidURL
    case missingIdentifier
}

protocol IMDFDecodable {
    init(feature: MKGeoJSONFeature, shouldParseProperties: Bool) throws
}

struct IMDFDecoder {
    private struct IMDFArchive {
        let baseDirectory: URL

        init(directory: URL) {
            baseDirectory = directory
        }

        func fileURL(for file: File) -> URL {
            baseDirectory.appending(component: file.filename)
        }

        enum File {
            case level
            case unit
            case opening
            case occupant

            var filename: String {
                "\(self).geojson"
            }
        }
    }

    private let geoJSONDecoder = MKGeoJSONDecoder()

    func decode() throws -> Level {
        guard let imdfDirectory = Bundle.main.url(forResource: "IMDFData", withExtension: nil) else {
            throw IMDFError.invalidURL
        }
        let archive = IMDFArchive(directory: imdfDirectory)

        let levels = try decodeFeatures(type: Level.self, from: .level, in: archive)
        let units = try decodeFeatures(type: Unit.self, from: .unit, in: archive)
        let openings = try decodeFeatures(type: Opening.self, from: .opening, in: archive)

        let occupants = try decodeOccupants(in: archive)

        guard levels.count == 1 else {
            throw IMDFError.invalidData
        }

        let level = levels[0]
        level.units = units
        level.openings = openings
        level.occupants = occupants
        return level
    }

    private func decodeFeatures<T: IMDFDecodable>(
        type: T.Type,
        from file: IMDFArchive.File,
        in archive: IMDFArchive,
        shouldParseProperties: Bool = false
    ) throws -> [T] {
        let fileURL = archive.fileURL(for: file)
        let data = try Data(contentsOf: fileURL)
        let geoJSONFeatures = try geoJSONDecoder.decode(data)
        guard let features = geoJSONFeatures as? [MKGeoJSONFeature] else {
            throw IMDFError.invalidType
        }
        let imdfFeatures = try features.map {
            try type.init(feature: $0, shouldParseProperties: shouldParseProperties)
        }
        return imdfFeatures
    }

    private func decodeOccupants(in archive: IMDFArchive) throws -> [Occupant] {
        let occupants = try decodeFeatures(type: Occupant.self, from: .occupant, in: archive, shouldParseProperties: true)

        for occupant in occupants {
            guard let pointGeometry = occupant.geometry[0] as? MKPointAnnotation else {
                fatalError()
                // throw IMDFError.invalidData
            }
            occupant.coordinate = pointGeometry.coordinate
            occupant.title = occupant.properties?.name
        }

        return occupants
    }
}
