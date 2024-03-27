//
//  SearchNavigationController.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

import UIKit

private extension String {
    static let routeStartTitle = "Куда"
    static let routeEndTitle = "Откуда"
    static let cancel = "Отменить"
}

protocol SearchNavigationControllerDelegate: AnyObject {
    func searchNavigationController(didSelectMapItem mapItem: MapItem)
    func mapItemViewControllerDidDisappear()
//    func didSelectRouteStart()
//    func didSelectRouteEnd()
}

final class SearchNavigationController: UINavigationController {
    
    private lazy var viewController = makeSearchViewController()
    
    weak var searchDelegate: SearchNavigationControllerDelegate?
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewController.title = "Поиск"
        addCancelButton(to: viewController)
        setViewControllers([viewController], animated: false)
    }
    
    // MARK: - Methods
    
    private func makeSearchViewController() -> UIViewController {
        let searchViewController = SearchTableViewController(items: MapItem.sampleData.map { $0.title ?? String($0.id) })
        searchViewController.delegate = self
        return searchViewController
    }
    
    private func addCancelButton(to viewController: UIViewController) {
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: .cancel,
            primaryAction: UIAction { _ in
                viewController.dismiss(animated: true)
            }
        )
    }
    
    private func makeMapDetailViewController(title: String) -> UIViewController {
        let mapItemDetail = MapItemDetailViewController(name: title)
        mapItemDetail.delegate = self
        mapItemDetail.navigationItem.setHidesBackButton(true, animated: true)
        mapItemDetail.navigationItem.rightBarButtonItem = .init(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(onCloseButtonTapped)
        )
        mapItemDetail.delegate = self
        return mapItemDetail
    }
    
    @objc private func onCloseButtonTapped() {
        self.popViewController(animated: true)
    }
}

extension SearchNavigationController: MapItemDetailDelegate {
    func didDisappear() {
        searchDelegate?.mapItemViewControllerDidDisappear()
    }
}

// MARK: - SearchViewControllerDelegate

extension SearchNavigationController: SearchTableViewControllerDelegate {
    func searchTableViewController(didSelectRowAt indexPath: IndexPath) {
        
        if viewController.title == "Поиск" {
            let mapItem = MapItem.sampleData[indexPath.row]
            let viewController = makeMapDetailViewController(title: mapItem.title ?? String(mapItem.id))
            pushViewController(viewController, animated: true)
            searchDelegate?.searchNavigationController(didSelectMapItem: mapItem)
        } else {
            let routeViewController = RouteViewController(from: "Туалет", to: "Выход")
            routeViewController.title = "Маршрут"
            pushViewController(routeViewController, animated: true)
        }
    }
}


extension SearchNavigationController: MapItemDetailDelegate {
    func fromButtonTapped() {
        viewController = makeSearchViewController()
        viewController.title = "Откуда"
        pushViewController(viewController, animated: true)
    }
    
    func toButtonTapped() {
        viewController = makeSearchViewController()
        viewController.title = "Куда"
        pushViewController(viewController, animated: true)
    }
}
