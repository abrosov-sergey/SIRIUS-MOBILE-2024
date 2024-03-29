//
//  MapViewController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import MapKit
import UIKit

protocol MapViewControllerDelegate: AnyObject {
    func didTapSearchButton()
    func didTapQRScannerButton()
}

// MARK: - MapViewController

final class MapViewController: UIViewController, MapViewControllerInterface {
    func setRouteStart(_: MapItem) {}

    func setRouteEnd(_: MapItem) {}

    func drawRoute(start _: MapItem, end _: MapItem) {}
    func drawRoute() {}

//    private func updateUI() {
//        if let routeStart, let routeEnd {
//            buildRoute(start: routeStart, end: routeEnd)
//        }
//
//        //guard let routeStart, let routeEnd else { fatalError() }
//    }

    // MARK: - Properties

//    var routeStart: MapItem?
//    var routeEnd: MapItem?

    private var selectedItemAnnotaion: SelectedAnnotation?
    private var selectedMapItem: MapItem?
    private var routeStartAnnotation: RouteStartAnnotation?
    private var routeEndAnnotation: RouteEndAnnotation?

//    func setRouteStart() {
//        mapView.map.isScrollEnabled = true
//        mapView.map.isZoomEnabled = true
//        routeStart = selectedMapItem
//
    ////        if let routeStart, let routeEnd {
    ////            ///buildRoute()
    ////        }
//    }

//    func setRouteEnd() {
//        mapView.map.isScrollEnabled = true
//        mapView.map.isZoomEnabled = true
//        routeEnd = selectedMapItem
//        if let routeStart, let routeEnd {
//            //buildRoute()
//        }
//    }

    func select(_ mapItem: MapItem) {
        selectedMapItem = mapItem

        mapView.map.isScrollEnabled = false
        mapView.map.isZoomEnabled = false

        let coordinate = CLLocationCoordinate2D(
            latitude: mapItem.coordinate.latitude,
            longitude: mapItem.coordinate.longitude
        )

        selectedItemAnnotaion = SelectedAnnotation(coordinate: coordinate)
        mapView.map.addAnnotation(selectedItemAnnotaion!)

        mapView.map.setRegion(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025)
            ),
            animated: true
        )
    }

    func deselectMapItem() {
        // Тут креш при выборе второй точки
        guard let annotation = selectedItemAnnotaion else { fatalError() }

        mapView.map.removeAnnotation(annotation)
        selectedItemAnnotaion = nil
        mapView.map.isScrollEnabled = true
        mapView.map.isZoomEnabled = true
    }

    private class SelectedAnnotation: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D

        init(coordinate: CLLocationCoordinate2D) {
            self.coordinate = coordinate
        }
    }

    private lazy var mapView = MapView()

    weak var delegate: MapViewControllerDelegate?

    // private var route: Route?
    // private var routeOverlay: RouteOverlay?// = RouteOverlay(path: route?.path)
    // private var routeRenderer: RouteRenderer?//(route: routeOverlay)

    // MARK: - Life Cycle

    override func loadView() {
        view = mapView
        mapView.onSearchButtonTap = { [weak self] in
            self?.delegate?.didTapSearchButton()
        }
        mapView.onQRScannerButtonTap = { [weak self] in
            self?.delegate?.didTapQRScannerButton()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView.setupAnnotations()
    }

//    private func selectAnnotation(_ annotation: MKAnnotation) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
//            self.mapView.map.view(for: annotation)?.setSelected(true, animated: true)
//        }
//    }

//    private func activateRoute(routeOverlay: RouteOverlay) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
//            guard
//                let startView = self.mapView.map.view(for: routeOverlay.routeStartAnnotation),
//                let endView = self.mapView.map.view(for: routeOverlay.routeEndAnnotation)
//            else {
//                return
//            }
//            startView.setSelected(true, animated: true)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                endView.setSelected(true, animated: true)
//            }
//        }
//    }

//    @objc
//    func clearRoute() {
//        if let routeOverlay {
//            mapView.map.removeOverlay(routeOverlay)
//            mapView.map.removeAnnotation(routeOverlay.routeEndAnnotation)
//            mapView.map.removeAnnotation(routeOverlay.routeStartAnnotation)
//        }
//        routeOverlay = nil
//        routeRenderer = nil
//        routeEnd = nil
//        routeStart = nil
//    }
//
//    private func buildRoute(start: MapItem, end: MapItem) {
//        let route = MockPathBuilder().route(start: start, end: end)
//        let overlay = RouteOverlay(path: route.path)
//        routeOverlay = overlay
//        routeRenderer = RouteRenderer(routeOverlay: overlay)
//        mapView.map.addOverlay(overlay, level: .aboveRoads)
//        mapView.map.addAnnotations([overlay.routeEndAnnotation, overlay.routeStartAnnotation])
//    }

    // MARK: - Methods

    private func setupMapView() {
        mapView.map.delegate = self

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
            mapView.setupMap(with: overlays, and: level.units)
        }
    }
}

extension Feature {
    var overlay: MKOverlay? {
        geometry.first as? MKOverlay
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    func mapView(_: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is RouteStartAnnotation {
//            let markerAnnotaionView = MKMarkerAnnotationView(annotation: routeOverlay!.routeStartAnnotation, reuseIdentifier: nil)
//            markerAnnotaionView.markerTintColor = .systemGreen
//            return markerAnnotaionView
//        }

//        if annotation is RouteStartAnnotation {
//            markerAnnotaionView.markerTintColor = .systemGreen
//            markerAnnotaionView.setSelected(true, animated: true)
//            return markerAnnotaionView
        // } else
        if annotation is SelectedAnnotation { // || annotation is RouteEndAnnotation {
            let markerAnnotaionView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            markerAnnotaionView.setSelected(true, animated: true)
            return markerAnnotaionView
        }
        return nil
    }

    func mapView(_: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        switch overlay {
//        case is RouteOverlay:
//            return routeRenderer!
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

    func mapView(_: MKMapView, didSelect _: MKAnnotationView) {}
}
