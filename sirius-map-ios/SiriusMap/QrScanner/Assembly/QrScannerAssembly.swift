//
//  QrScannerAssembly.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 26.03.2024.
//

import Foundation

// MARK: - QrScannerAssembly

final class QrScannerAssembly {
    
    // MARK: - Properties
    
    private var model: QrScannerModel?
    private var view: QrScannerView?
    private var controller: QrScannerController?
    
    // MARK: - Initializer
    
    init(
        model: QrScannerModel?,
        view: QrScannerView?,
        controller: QrScannerController?
    ) {
        self.model = model
        self.view = view
        self.controller = controller
    }
    
    // MARK: - Configure dependencies
    
    private func configureDependencies() {
        controller?.mainView = view
        controller?.model = model
        
        view?.output = controller
        model?.output = controller
    }
}
