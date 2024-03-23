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
        let mapItemDetail = MapItemDetailViewController(name: title)
        mapItemDetail.deligate = self
        return mapItemDetail
    }
}

// MARK: - SearchViewControllerDelegate

extension SearchNavigationController: SearchTableViewControllerDelegate {
    func searchTableViewController(didSelectRowAt indexPath: IndexPath) {
        let title = MapItem.sampleData[indexPath.row].name
        let viewController = makeMapDetailViewController(title: title)
        setSheetPresentation(multiplier: 0.2)
        pushViewController(viewController, animated: true)
    }
    
    private func setSheetPresentation(multiplier: Double) {
        if let sheet = self.sheetPresentationController {
            let fraction = UISheetPresentationController.Detent.custom { context in
                (self.view.window?.frame.height ?? 0) * multiplier
                
            }
            sheet.detents = [fraction]
            let oldValue = sheet.selectedDetentIdentifier ?? .medium
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = oldValue
            }
        }
    }
}

extension SearchNavigationController: SearchNavigationControllerDeligate {
    func resize() {
        if let sheet  = self.sheetPresentationController {
            sheet.detents = [.large()]
            let oldValue = sheet.selectedDetentIdentifier ?? .medium
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = oldValue
            }
        }
    }
}
