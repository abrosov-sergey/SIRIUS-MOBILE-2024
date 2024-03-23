//
//  RouteBuildingModel.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 23.03.2024.
//

import Foundation

// MARK: - Model Input

protocol RouteBuildingModelInput {
    
}

// MARK: - Controller Output

protocol RouteBuildingModelOutput: AnyObject {
    
}

// MARK: - RouteBuildingModel

final class RouteBuildingModel {
    weak var output: RouteBuildingModelOutput?
}

// MARK: - Model Input

extension RouteBuildingModel: RouteBuildingModelInput {
    
}
