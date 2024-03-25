//
//  MapViewController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit
import UIKit

protocol MapViewControlelrDelegate: AnyObject {
    func onSearchButtonClicked()
}

final class MapViewController: UIViewController {
    
    private lazy var mapView = MapView()
    
    private lazy var searchButton: UIButton = {
        let button = ButtonWithIcon(type: .search)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: MapViewControlelrDelegate?
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addOverlays()
        mapView.map.delegate = self
        setupButtons()
    }
    
    // MARK: - Methods
    
    private func addOverlays() {
        
        var level: Level?
        do {
            level = try IMDFDecoder().decode()
        } catch {
            print(error)
        }
        
        if let level, let levelOverlay = level.overlay {
            mapView.map.setVisibleMapRect(
                levelOverlay.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true
            )
            
            mapView.map.addOverlay(levelOverlay)
            
            let unitOverlays = level.units.compactMap { $0.overlay }
            mapView.map.addOverlays(unitOverlays)
        }
    }
    
    private func setupButtons() {
        searchButton.addTarget(self, action: #selector(onSearchButtonClicked), for: .touchUpInside)
        view.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18.0)
        ])
    }
    
    @objc private func onSearchButtonClicked() {
        delegate?.onSearchButtonClicked()
    }
}

extension Feature {
    var overlay: MKOverlay? {
        geometry.first as? MKOverlay
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(named: "LevelStroke")
        renderer.lineWidth = 2.0
        return renderer
    }
}
