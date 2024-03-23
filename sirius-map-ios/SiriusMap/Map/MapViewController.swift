//
//  MapViewController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit
import UIKit

final class MapViewController: UIViewController {
    
    private var mapView: MKMapView {
        guard let view = self.view as? MapView else { fatalError("Unsupported view type.") }
        return view.map
    }

    // MARK: - Life Cycle
    
    override func loadView() {
        view = MapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addOverlays()
        
        mapView.delegate = self
    }
    
    // MARK: - Methods
    
    private func addOverlays() {
        
        var level: Level?
        do {
            level = try IMDFDecoder().decode()
        } catch {
            print(error)
        }
        
        if let level, let levelOverlay = level.geometry[0] as? MKOverlay {
            mapView.setVisibleMapRect(levelOverlay.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
            
            mapView.addOverlay(levelOverlay)
            
            let unitOverlays = level.units.compactMap { $0.geometry[0] as? MKOverlay }
            mapView.addOverlays(unitOverlays)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(named: "LevelStroke")
        renderer.lineWidth = 2.0
        return renderer
    }
}
