//
//  SheetNavigationController.swift
//  SiriusMap
//
//  Created by Egor on 28.03.2024.
//

import UIKit

protocol RouteViewControllerDelegate: AnyObject {
    func didTapStartCell()
    func didTapEndCell()
    func didChangeRoute()
}

final class MockRouteViewController: UIViewController {
    
    private lazy var startItem = UIBarButtonItem(
        title: "Откуда",
        primaryAction: UIAction { [weak self] _ in
            self?.delegate?.didTapStartCell()
        }
    )
    private lazy var endItem = UIBarButtonItem(
        title: "Куда",
        primaryAction: UIAction { [weak self] _ in
            self?.delegate?.didTapStartCell()
        }
    )
    
    weak var delegate: RouteViewControllerDelegate?
    
    init(routeEnd: MapItem) {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .rewind,
            primaryAction: UIAction { [weak self] _ in
                self?.delegate?.didChangeRoute()
            }
        )
        
        endItem.title = routeEnd.title
        navigationItem.leftBarButtonItems = []
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setRouteStart(_ mapItem: MapItem) {
        startItem.title = mapItem.title
    }
    func setRouteEnd(_ mapItem: MapItem) {
        endItem.title = mapItem.title
    }
}

protocol SheetNavigationControllerDelegate: AnyObject {
    func searchTableViewControllerDidSelect(mapItem: MapItem)
}

final class SheetNavigationController: UINavigationController {
    
    func setRouteEnd(_ mapItem: MapItem) {
        if let routeViewController {
            routeViewController.setRouteEnd(mapItem)
            return
        }
        
        routeViewController = MockRouteViewController(routeEnd: mapItem)
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
    private var routeViewController: MockRouteViewController?
    
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
        pushViewController(routeViewController!, animated: true)
    }
}
