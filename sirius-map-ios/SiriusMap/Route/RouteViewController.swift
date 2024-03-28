//
//  RouteViewController.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 26.03.2024.
//

import Foundation
import SwiftUI
import UIKit

protocol RouteViewControllerDelegate: AnyObject {
    func onTapStartCell()
    func onTapEndCell()
    func onChangeRoute()
}

final class RouteViewController: UIViewController {

    weak var delegate: RouteViewControllerDelegate?
    
    private lazy var actions: RouteView.Actions = {
        return RouteView.Actions(
            onTapStartCell: delegate?.onTapStartCell ?? {},
            onTapEndCell: delegate?.onTapEndCell ?? {},
            onChangeRoute: delegate?.onChangeRoute ?? {}
        )
    }()
    
    private let sheetHeight: CGFloat = 200.0
    
    private let endRouteItem: MapItem
    
    init(endRouteItem: MapItem) {
        self.endRouteItem = endRouteItem
        
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var hostingController = UIHostingController(
        rootView: RouteView(
            endRouteItem,
            actions: actions
        )
    )
    
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
            routeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        hostingController.didMove(toParent: self)
    }
}
