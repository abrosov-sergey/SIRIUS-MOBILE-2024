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
    private lazy var map = {
        let mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return mapView
    }()

    func setRouteStart(_ mapItem: MapItem) {
        let coordinate = CLLocationCoordinate2D(
            latitude: mapItem.coordinate.latitude,
            longitude: mapItem.coordinate.longitude
        )

        map.addAnnotation(RouteStartAnnotation(coordinate: coordinate, title: mapItem.title))

        map.setRegion(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            ),
            animated: true
        )
    }

    func setRouteEnd(_ mapItem: MapItem) {
        let coordinate = CLLocationCoordinate2D(
            latitude: mapItem.coordinate.latitude,
            longitude: mapItem.coordinate.longitude
        )

        map.addAnnotation(RouteEndAnnotation(coordinate: coordinate, title: mapItem.title))

        map.setRegion(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            ),
            animated: true
        )
    }

    func drawRoute() {}

    weak var delegate: NewMapViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        view.addSubview(map)
    }
}

extension NewMapViewController: MKMapViewDelegate {
    func mapView(_: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)

        switch annotation {
        case is RouteEndAnnotation:
            marker.setSelected(true, animated: true)
            marker.markerTintColor = .systemGreen
        case is RouteStartAnnotation:
            marker.setSelected(true, animated: true)
        // marker.markerTintColor = .systemRed
        default:
            fatalError()
        }
        return marker
    }
}
