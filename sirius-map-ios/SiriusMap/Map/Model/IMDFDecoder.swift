//
//  IMDFDecoder.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit

enum IMDFError: Error {
    case invalidType
    case invalidData
}

protocol IMDFDecodable {
    init(feature: MKGeoJSONFeature) throws
}

struct IMDFDecoder {
    
    private struct IMDFArchive {
        
        let baseDirectory: URL
        
        init(directory: URL) {
            baseDirectory = directory
        }
        
        func fileURL(for file: File) -> URL {
            return baseDirectory.appending(component: file.filename)
        }
        
        
        enum File {
            case level
            case unit
            
            var filename: String {
                return "\(self).geojson"
            }
        }
    }
    
    private let geoJSONDecoder = MKGeoJSONDecoder()
    
    func decode() throws -> Level {
        let imdfDirectory = Bundle.main.resourceURL!.appending(path: "IMDFData")
        let archive = IMDFArchive(directory: imdfDirectory)
        
        let levels = try decodeFeatures(type: Level.self, from: .level, in: archive)
        let units = try decodeFeatures(type: Unit.self, from: .unit, in: archive)
        
        guard levels.count == 1 else {
            throw IMDFError.invalidData
        }
                
        let level = levels[0]
        level.units = units
        return level
    }
    
    private func decodeFeatures<T: IMDFDecodable>(
        type: T.Type,
        from file: IMDFArchive.File,
        in archive: IMDFArchive
    ) throws -> [T] {
        let fileURL = archive.fileURL(for: file)
        let data = try Data(contentsOf: fileURL)
        let geoJSONFeatures = try geoJSONDecoder.decode(data)
        guard let features = geoJSONFeatures as? [MKGeoJSONFeature] else {
            throw IMDFError.invalidType
        }
        let imdfFeatures = try features.map { try type.init(feature: $0) }
        return imdfFeatures
    }
}
