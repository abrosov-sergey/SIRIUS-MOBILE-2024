//
//  RootNavigationController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import UIKit

final class RootNavigationController: UINavigationController {
    
    private let mapViewController = MapViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewController.delegate = self
        setViewControllers([mapViewController], animated: false)
    }
}

extension RootNavigationController: MapViewControllerDelegate {
    func didTapSearchButton() {
        let searchNavigationController = SearchNavigationController()
        searchNavigationController.searchDelegate = self
        //mapViewController.clearRoute()
        present(searchNavigationController, animated: true)
    }
    
    func qrScannerButtonPressed() {
        let qrScannerModule = QrScannerAssembly(
            model: QrScannerModel(),
            view: QrScannerView(),
            controller: QrScannerController()
        )
        qrScannerModule.configureDependencies()
        
        present(qrScannerModule.controller, animated: true)
    }
}

extension RootNavigationController: SearchNavigationControllerDelegate {
    
//    func didSelectRouteStart() {
//        //mapViewController.setRouteStart()
//        //searchNavigationViewCotroller.dismiss(animated: true)
//    }
//    
//    func didSelectRouteEnd() {
//        //mapViewController.setRouteEnd()
//        //searchNavigationViewCotroller.dismiss(animated: true)
//    }
    
    func searchNavigationController(didSelectMapItem mapItem: MapItem) {
        mapViewController.select(mapItem)
    }
    
    func mapItemViewControllerDidDisappear() {
        mapViewController.deselectMapItem()
    }
    
//    func
//    func didTapCloseDetail() {
//        mapViewController.unselect()
//    }
}
