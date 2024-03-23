//
//  RouteBuildingAssembly.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 23.03.2024.
//

import Foundation

// MARK: - RouteBuildingAssembly

final class RouteBuildingAssembly {
    
    // MARK: - Properties
    
    private var model: RouteBuildingModel?
    private var view: RouteBuildingView?
    private var controller: RouteBuildingController?
    
    // MARK: - Initializer
    
    init(
        model: RouteBuildingModel?,
        view: RouteBuildingView?,
        controller: RouteBuildingController?
    ) {
        self.model = model
        self.view = view
        self.controller = controller
    }
    
    // MARK: - Configure dependencies
    
    private func configureDependencies() {
        controller?.view = view
        controller?.model = model
        
        view?.output = controller
        model?.output = controller
    }
}
