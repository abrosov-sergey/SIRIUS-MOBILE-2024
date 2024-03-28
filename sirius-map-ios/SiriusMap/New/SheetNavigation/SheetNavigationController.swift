//
//  SheetNavigationController.swift
//  SiriusMap
//
//  Created by Egor on 28.03.2024.
//

import UIKit

protocol SheetNavigationControllerDelegate: AnyObject {
    func searchTableViewControllerDidSelect(mapItem: MapItem)

    func routeViewControllerDidSelectStartCell()
    func routeViewControllerDidSelectEndCell()
    func routeViewControllerDidChangeRoute()
}

final class SheetNavigationController: UINavigationController {
    func showSearch(with title: String) {
        searchTableViewController.title = title
        pushViewController(searchTableViewController, animated: true)
        // popViewController(animated: true)
    }

    func setRouteEnd(_ mapItem: MapItem) {
        if let routeViewController {
            routeViewController.setRouteEnd(mapItem)
            return
        }

        routeViewController = RouteViewController(endRouteItem: mapItem)
        routeViewController?.delegate = self
    }

    func setRouteStart(_ mapItem: MapItem) {
        routeViewController?.setRouteStart(mapItem)
    }

    weak var sheetDelegate: SheetNavigationControllerDelegate?

    private lazy var searchTableViewController: SearchTableViewController = {
        let search = SearchTableViewController(items: MapItem.sampleData)
        search.delegate = self
        return search
    }()

    private var routeViewController: RouteViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewControllers([searchTableViewController], animated: true)

        setupSheet()
    }

    private func setupSheet() {
        isModalInPresentation = true
        if let sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .medium
        }
    }
}

extension SheetNavigationController: SearchTableViewControllerDelegate {
    func searchTableViewController(didSelect mapItem: MapItem) {
        sheetDelegate?.searchTableViewControllerDidSelect(mapItem: mapItem)
        setViewControllers([routeViewController!], animated: true)
    }
}

extension SheetNavigationController: RouteViewControllerDelegate {
    func onTapStartCell() {
        sheetDelegate?.routeViewControllerDidSelectStartCell()
    }

    func onTapEndCell() {
        sheetDelegate?.routeViewControllerDidSelectEndCell()
    }

    func onChangeRoute() {
        sheetDelegate?.routeViewControllerDidChangeRoute()
    }
}
