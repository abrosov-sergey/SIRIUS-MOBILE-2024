//
//  RouteViewController.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 26.03.2024.
//

import Foundation
import UIKit
import SwiftUI

final class RouteViewController: UIViewController {
    
    private let hostingController = UIHostingController(rootView: RouteView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let sheet = sheetPresentationController {
            let fraction = UISheetPresentationController.Detent.custom { _ in 360 }
            sheet.detents = [fraction]
            
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = sheet.selectedDetentIdentifier ?? .medium
            }
        }
    }
    
    private func setup() {
        guard let routeView = hostingController.view else { return }
        routeView.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(hostingController)
        view.addSubview(routeView)
        
        NSLayoutConstraint.activate([
            routeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            routeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            routeView.topAnchor.constraint(equalTo: view.topAnchor),
            routeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
}
