//
//  SearchNavigationController.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

import UIKit

extension String {
    static let title = "Куда"
    static let cancel = "Отменить"
}

final class SearchNavigationController: UINavigationController {
    
    private lazy var viewController = makeSearchViewController()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewController.title = "Поиск"
        addCancelButton(to: viewController)
        setViewControllers([viewController], animated: false)
    }
    
    // MARK: - Methods
    
    private func makeSearchViewController() -> UIViewController {
        let searchViewController = SearchTableViewController(items: MapItem.sampleData.map { $0.name })
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
        return mapItemDetail
    }
    
    @objc private func onCloseButtonTapped() {
        self.popViewController(animated: true)
    }
}

// MARK: - SearchViewControllerDelegate

extension SearchNavigationController: SearchTableViewControllerDelegate {
    func searchTableViewController(didSelectRowAt indexPath: IndexPath) {
        
        if viewController.title == "Поиск" {
            let title = MapItem.sampleData[indexPath.row].name
            let viewController = makeMapDetailViewController(title: title)

            pushViewController(viewController, animated: true)
        } else {
            let routeViewController = RouteViewController()
            routeViewController.title = "Маршрут"
            pushViewController(routeViewController, animated: true)
        }
        
    }
}


extension SearchNavigationController: MapItemDetailDelegate {
    func onHereButtonTouched() {
        
        viewController = makeSearchViewController()
        viewController.title = "Откуда"
        pushViewController(viewController, animated: true)
    }
    
    func onFromHereButtonTouched() {
        viewController = makeSearchViewController()
        viewController.title = "Куда"
        pushViewController(viewController, animated: true)
    }
}
