//
//  MapViewController.swift
//  SiriusMap
//
//  Created by Глеб Писарев on 22.03.2024.
//

import Foundation
import UIKit
import MapKit

protocol MapViewControllerDeligate: AnyObject {
    func onSearchButtonClicked()
}

final class MapViewController: UIViewController {
    
    weak var deligate: MapViewControllerDeligate!
    
    private var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        let initialLocation = CLLocationCoordinate2D(latitude: 43.414713, longitude: 39.950758)
        let regionRadius: CLLocationDistance = 300
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        let searchButton = ButtonWithIcon(type: .search)
        searchButton.addTarget(self, action: #selector(onSearchButtonClicked), for: .allTouchEvents)
        
        let geoButton = ButtonWithIcon(type: .pin)
        geoButton.addTarget(self, action: #selector(onGeoButtonClicked), for: .allTouchEvents)
        
        buttonStack.addArrangedSubview(searchButton)
        buttonStack.addArrangedSubview(geoButton)
        
        mapView.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            buttonStack.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -60),
            buttonStack.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -18),
            buttonStack.widthAnchor.constraint(equalToConstant: 60),
            buttonStack.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    @objc private func onSearchButtonClicked() {
        deligate.onSearchButtonClicked()
    }
    
    @objc private func onGeoButtonClicked() {
        let initialLocation = CLLocationCoordinate2D(latitude: 43.414713, longitude: 39.950758)
        let regionRadius: CLLocationDistance = 300
        let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
    }
    
}
