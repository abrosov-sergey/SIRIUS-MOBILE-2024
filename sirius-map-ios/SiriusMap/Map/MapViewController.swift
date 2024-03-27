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
    func qrScannerButtonPressed()
}

fileprivate enum Icons: String  {
    case qrScannerIcon = "QrScannerIcon"
    
    var size: CGSize {
        get {
            switch self {
            case .qrScannerIcon:
                return CGSize(width: 56.0, height: 56.0)
            }
        }
    }
}

// MARK: - MapViewController

final class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var mapView = MapView()
    
    private lazy var searchButton: UIButton = {
        let button = ButtonWithIcon(type: .search)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var qrScannerButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Icons.qrScannerIcon.rawValue), for: .normal)
        return button
    }()
    
    weak var delegate: MapViewControlelrDelegate?
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
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
    
    private func setupMap() {
        addOverlays()
        
        mapView.map.delegate = self
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(gestureReconizer:)))
        longPressGestureRecognizer.minimumPressDuration = 0.5
        longPressGestureRecognizer.delaysTouchesBegan = true
        longPressGestureRecognizer.delegate = self
        mapView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    private func setupButtons() {
        [searchButton, qrScannerButton].forEach {
            view.addSubview($0)
        }
        
        searchButton.addTarget(self, action: #selector(onSearchButtonClicked), for: .touchUpInside)
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18.0)
        ])
        
        qrScannerButton.addTarget(self, action: #selector(qrScannerButtonPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            qrScannerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            qrScannerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18.0),
            qrScannerButton.widthAnchor.constraint(equalToConstant: Icons.qrScannerIcon.size.width),
            qrScannerButton.heightAnchor.constraint(equalToConstant: Icons.qrScannerIcon.size.height)
        ])
    }
    
    @objc private func onSearchButtonClicked() {
        delegate?.onSearchButtonClicked()
    }
    
    @objc private func qrScannerButtonPressed() {
        delegate?.qrScannerButtonPressed()
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

extension MapViewController: UIGestureRecognizerDelegate {
    @objc private func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            let touchLocation = gestureReconizer.location(in: mapView)
            let locationCoordinate = mapView.map.convert(touchLocation, toCoordinateFrom: mapView.map)
            print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
            return
        }
        
        if gestureReconizer.state != UIGestureRecognizer.State.began {
            return
        }
    }
}
