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

    private lazy var routeView = RouteView(
        endRouteItem,
        actions: actions
    )

    private lazy var hostingController = UIHostingController(
        rootView: routeView
    )

    private lazy var actions: RouteView.Actions = .init(
        onTapStartCell: delegate?.onTapStartCell ?? {},
        onTapEndCell: delegate?.onTapEndCell ?? {},
        onChangeRoute: delegate?.onChangeRoute ?? {}
    )

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        title = "Маршрут"

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let sheet = sheetPresentationController {
            let fraction = UISheetPresentationController.Detent.custom { _ in self.sheetHeight }
            sheet.detents = [fraction]

            sheet.largestUndimmedDetentIdentifier = fraction.identifier

            sheet.animateChanges {
                sheet.selectedDetentIdentifier = sheet.selectedDetentIdentifier ?? .medium
            }
        }
    }

    func setRouteStart(_ item: MapItem) {
        routeView.setRouteStart(item)
    }

    func setRouteEnd(_ item: MapItem) {
        routeView.setRouteEnd(item)
    }

    private func setup() {
        guard let routeUiView = hostingController.view else { return }
        routeUiView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(routeUiView)

        NSLayoutConstraint.activate([
            routeUiView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            routeUiView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            routeUiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            routeUiView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
