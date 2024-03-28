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

final class NewMapViewController: UIViewController {
    private lazy var map = {
        let mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return mapView
    }()

    private var routeRenderer: RouteRenderer?

    weak var delegate: NewMapViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        view.addSubview(map)
        setupMap()
    }

    private func setupMap() {
        var level: Level?
        do {
            level = try IMDFDecoder().decode()
        } catch {
            print(error)
        }

        if let level, let levelOverlay = level.overlay {
            let unitOverlays = level.units.compactMap { $0.overlay }
            let openingOverlays = level.openings.compactMap { $0.overlay }

            let overlays = [levelOverlay] + unitOverlays + openingOverlays
            guard let levelOverlay = overlays.first else { fatalError() }

            map.setVisibleMapRect(
                levelOverlay.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true
            )
            map.addOverlays(overlays)
        }
    }
}

extension NewMapViewController: MapViewControllerInterface {
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

    func drawRoute(start: MapItem, end: MapItem) {
        let route = RouteService.shared.getRoute(start: start, end: end)
        let overlay = RouteOverlay(path: route.path)
        routeRenderer = RouteRenderer(routeOverlay: overlay)
        map.addOverlay(overlay, level: .aboveRoads)
    }
}

extension NewMapViewController: MKMapViewDelegate {
    func mapView(_: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
        marker.setSelected(true, animated: true)

        switch annotation {
        case is RouteEndAnnotation:
            marker.markerTintColor = .systemGreen
        case is RouteStartAnnotation:
            break
        default:
            fatalError()
        }
        return marker
    }

    func mapView(_: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        switch overlay {
        case is RouteOverlay:
            return routeRenderer!
        case is MKPolyline:
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(named: "WalkwayFill")
            renderer.lineWidth = 4.0
            return renderer
        case is MKPolygon:
            let renderer = MKPolygonRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(named: "LevelStroke")
            renderer.lineWidth = 2.0
            return renderer
        default:
            fatalError()
        }
    }
}
