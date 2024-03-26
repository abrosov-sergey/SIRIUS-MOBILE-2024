//
//  RootNavigationController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import UIKit

final class RootNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapViewController = MapViewController()
        mapViewController.delegate = self
        setViewControllers([mapViewController], animated: false)
    }
}

extension RootNavigationController: MapViewControlelrDelegate {
    func onSearchButtonClicked() {
        let searchNavigationViewCotroller = SearchNavigationController()
        present(searchNavigationViewCotroller, animated: true)
    }
    
    func qrScannerButtonPressed() {
        present(QrScannerController(), animated: true)
    }
}
