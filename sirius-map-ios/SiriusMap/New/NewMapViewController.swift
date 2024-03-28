//
//  NewMapViewController.swift
//  SiriusMap
//
//  Created by Egor on 28.03.2024.
//

import MapKit
import UIKit

protocol NewMapViewControllerDelegate: AnyObject {
    func mapViewController(_ mapViewController: NewMapViewController, didTapPointAt location: Coordinate)
    func mapViewControler(_ mapViewController: NewMapViewController, didSelect mapItem: MapItem)
}

final class NewMapViewController: UIViewController, MapViewControllerInterface {
    func setRouteStart(_: MapItem) {}

    func setRouteEnd(_: MapItem) {}

    func drawRoute() {}

    weak var delegate: NewMapViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
    }
}
