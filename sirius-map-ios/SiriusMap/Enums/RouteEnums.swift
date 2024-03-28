//
//  RouteEnums.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 27.03.2024.
//

import Foundation

public enum Constants {
    static let longDistance: Double = 1_000_000.0
    static let R: Double = 6_371_000.0
}

public enum Speeds: Double {
    case fast = 7.0
    case medium = 5.0
    case slow = 4.0
}
