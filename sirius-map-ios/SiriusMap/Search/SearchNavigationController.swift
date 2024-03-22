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
    
    deinit {
        print("x")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = makeSearchViewController()
        addCancelButton(to: viewController)
        setViewControllers([viewController], animated: false)
    }
    
    // MARK: - Methods
    
    private func makeSearchViewController() -> UIViewController {
        let searchViewController = SearchTableViewController(items: MapItem.sampleData.map { $0.name })
        searchViewController.delegate = self
        searchViewController.title = .title
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
        let mapItemDetail = MapItemDetailViewController()
        mapItemDetail.title = title
        return mapItemDetail
    }
}

// MARK: - SearchViewControllerDelegate

extension SearchNavigationController: SearchTableViewControllerDelegate {
    func searchTableViewController(didSelectRowAt indexPath: IndexPath) {
        let title = MapItem.sampleData[indexPath.row].name
        let viewController = makeMapDetailViewController(title: title)
        pushViewController(viewController, animated: true)
    }
}
