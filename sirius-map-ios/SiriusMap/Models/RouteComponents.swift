//
//  RouteComponents.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 27.03.2024.
//

import Foundation
import MapKit

// MARK: - Components

public struct Anchor: Decodable {
    let id: Int
    let coordinates: [Double]
    let title: String?

    var mapItem: MapItem {
        MapItem(
            id: id,
            title: title,
            coordinate: Coordinate(
                latitude: coordinates[1],
                longitude: coordinates[0]
            )
        )
    }
}

public struct Coordinate {
    let latitude: Double
    let longitude: Double
}

public struct Route {
    let path: [MapItem]
    let eta: Double
}

public struct Graph {
    let mapItems: [MapItem]
    let edges =
        [
            1: [70, 71],
            2: [71, 73],
            3: [69, 70],
            4: [73, 74, 75],
            5: [75, 78],
            6: [78],
            7: [78],
            8: [77, 18],
            9: [77, 76],
            10: [77, 76],
            11: [73, 74, 76, 77],
            12: [73, 74, 76, 77],
            13: [72, 73, 70, 74],
            14: [80],
            15: [60, 59],
            16: [68, 69],
            17: [73, 74],
            18: [77, 78],
            19: [34, 36, 82, 20],
            20: [67, 82, 19],
            21: [64, 58],
            22: [63, 56],
            23: [63, 68],
            24: [35, 37, 38, 39],
            25: [66, 65],
            26: [40],
            27: [46, 47],
            28: [47, 48, 30],
            29: [48, 49, 31],
            30: [47, 48, 28],
            31: [48, 49, 29],
            32: [51, 52],
            33: [52],
            34: [19, 35],
            35: [34, 38, 24],
            36: [19, 37],
            37: [26, 39],
            38: [35, 24, 42],
            39: [37, 24, 40],
            40: [39, 26, 41],
            41: [40, 44, 43],
            42: [81, 43],
            43: [44, 41, 81],
            44: [41, 43, 81, 45],
            45: [44, 46, 53],
            46: [27, 47],
            47: [27, 46, 28, 30, 48],
            48: [28, 30, 47, 29, 31, 49],
            49: [48, 31, 29, 50],
            50: [49, 31, 51],
            51: [32, 49],
            52: [33, 51, 32],
            53: [45, 54],
            54: [55, 53],
            55: [54, 56],
            56: [63, 57, 55],
            57: [58, 59, 56],
            58: [21, 64, 59, 57],
            59: [58, 57, 15],
            60: [15, 61],
            61: [60, 63, 80],
            62: [60, 63],
            63: [68, 56, 22, 23],
            64: [65, 21, 58],
            65: [64, 25, 66],
            66: [67, 25, 65],
            67: [20, 66, 82],
            68: [63, 23, 69, 16],
            69: [16, 68, 3, 70, 1, 71, 72, 13],
            70: [69, 72, 71, 2, 13, 1],
            71: [2, 1, 70, 73, 75],
            72: [13, 70, 79, 73, 69, 76],
            73: [72, 71, 79, 2, 13, 74],
            74: [73, 12, 76, 75, 4, 71, 72, 2, 79],
            75: [74, 4, 5, 78, 6, 7, 71],
            76: [74, 11, 12, 10, 9, 77, 8, 72],
            77: [9, 10, 8, 76, 11, 12, 74, 18],
            78: [18, 75, 7, 6],
            79: [80, 72, 73],
            80: [79, 61, 14],
            81: [43, 42, 44],
            82: [83, 67, 20, 19, 36, 34],
            83: [82],
            84: [90, 89],
            86: [87, 45, 53, 46],
            87: [88, 86],
            88: [87, 89],
            89: [88, 84],
            90: [84, 91],
            91: [90, 92],
            92: [91, 93],
            93: [94, 92],
            94: [93, 58, 59, 57],
        ]
}

struct PointDistance: Comparable {
    static func < (lhs: PointDistance, rhs: PointDistance) -> Bool {
        lhs.distance < rhs.distance
    }

    let distance: Double
    let index: Int
}

// MARK: - Extensions

public extension Coordinate {
    var clCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
