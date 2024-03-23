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
    }
}
