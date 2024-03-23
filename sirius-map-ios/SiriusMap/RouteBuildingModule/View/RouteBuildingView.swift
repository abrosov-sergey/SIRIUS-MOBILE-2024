//
//  RouteBuildingView.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 23.03.2024.
//

import UIKit

// MARK: - View Input

protocol RouteBuildingViewInput {
    
}

// MARK: - Controller Output

protocol RouteBuildingViewOutput: AnyObject {
    
}

// MARK: - RouteBuildingView

final class RouteBuildingView {
    weak var output: RouteBuildingViewOutput?
}

// MARK: - View Input

extension RouteBuildingView: RouteBuildingViewInput {
    
}
