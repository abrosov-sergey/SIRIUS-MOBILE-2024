//
//  RootViewController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import UIKit

final class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapViewController = MapViewController()
        mapViewController.deligate = self
        transition(to: mapViewController)
    }
}

extension RootViewController: MapViewControllerDeligate {
    func onSearchButtonClicked() {
        let searchViewController = SearchNavigationController()
        present(searchViewController, animated: true)
    }
    
    
}
