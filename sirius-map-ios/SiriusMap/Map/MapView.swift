//
//  MapView.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit
import UIKit

final class MapView: UIView {
    
    let map = MKMapView()
    
    var onSearchButtonTap: (() -> Void)?
    
    private lazy var searchButton: UIButton = {
        let button = ButtonWithIcon(type: .search)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(map)
        
        map.frame = bounds
        map.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupButtons()
    }
    
    private func setupButtons() {
        searchButton.addTarget(self, action: #selector(searchButtonTap), for: .touchUpInside)
        addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
            searchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18.0)
        ])
    }
    
    @objc
    private func searchButtonTap() {
        onSearchButtonTap?()
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
}
