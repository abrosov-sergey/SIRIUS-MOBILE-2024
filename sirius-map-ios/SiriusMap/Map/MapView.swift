//
//  MapView.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit
import UIKit

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

final class MapView: UIView {
    
    let map = MKMapView()
    
    var onSearchButtonTap: (() -> Void)?
    var onQRScannerButtonTap: (() -> Void)?
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMap(with overlays: [MKOverlay], and annotations: [MKAnnotation]) {
        guard let levelOverlay = overlays.first else { fatalError() }
                
        map.setVisibleMapRect(
            levelOverlay.boundingMapRect,
            edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
            animated: true
        )
        map.addOverlays(overlays)
        map.addAnnotations(annotations)
    }
    
    func setupAnnotations() {
        map.pointOfInterestFilter = .excludingAll
        for annotation in map.annotations {
            map.view(for: annotation)?.alpha = 0
        }
    }
    
    private func setup() {
        addSubview(map)
        
        map.frame = bounds
        map.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupButtons()
        setupLongPress()
    }
    
    private func setupButtons() {
        [searchButton, qrScannerButton].forEach {
            addSubview($0)
        }
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
            searchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18.0)
        ])
        
        qrScannerButton.addTarget(self, action: #selector(qrScannerButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            qrScannerButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            qrScannerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18.0),
            qrScannerButton.widthAnchor.constraint(equalToConstant: Icons.qrScannerIcon.size.width),
            qrScannerButton.heightAnchor.constraint(equalToConstant: Icons.qrScannerIcon.size.height)
        ])
    }
    
    @objc
    private func searchButtonTapped() {
        onSearchButtonTap?()
    }
    
    @objc
    private func qrScannerButtonTapped() {
        onQRScannerButtonTap?()
    }
    
    private func setupLongPress() {
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(gestureReconizer:)))
        longPressGestureRecognizer.minimumPressDuration = 0.5
        longPressGestureRecognizer.delaysTouchesBegan = true
        map.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc private func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            let touchLocation = gestureReconizer.location(in: map)
            let locationCoordinate = map.convert(touchLocation, toCoordinateFrom: map)
            print("Tapped at lat: \(locationCoordinate.latitude) long: \(locationCoordinate.longitude)")
        }
    }
}
