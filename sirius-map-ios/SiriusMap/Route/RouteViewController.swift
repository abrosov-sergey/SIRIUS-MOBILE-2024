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
    
    private let sheetHeight: CGFloat = 200.0
    
    let from: String
    let to: String
    
    init(from: String, to: String) {
        self.from = from
        self.to = to
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var hostingController = UIHostingController(rootView: RouteView(from: from, to: to))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let sheet = sheetPresentationController {
            let fraction = UISheetPresentationController.Detent.custom { _ in self.sheetHeight }
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
