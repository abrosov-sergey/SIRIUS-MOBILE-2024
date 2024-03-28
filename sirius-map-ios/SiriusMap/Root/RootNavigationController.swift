//
//  RootNavigationController.swift
//  SiriusMap
//
//  Created by Egor on 22.03.2024.
//

import UIKit

protocol Routing {
    var routeStart: MapItem? { get set }
    var routeEnd: MapItem? { get set }

    var isEmptyRoute: Bool { get }
    var hasStart: Bool { get }
    var hasEnd: Bool { get }
}

struct RoutePoints: Routing {
    var routeStart: MapItem?
    var routeEnd: MapItem?

    var isEmptyRoute: Bool {
        routeEnd == nil && routeStart == nil
    }

    var hasStart: Bool {
        routeStart != nil
    }

    var hasEnd: Bool {
        routeEnd != nil
    }
}

protocol MapViewControllerInterface {
    func setRouteStart(_ mapItem: MapItem)
    func setRouteEnd(_ mapItem: MapItem)
    func drawRoute(start: MapItem, end: MapItem)
}

final class RootNavigationController: UINavigationController {
    private let useNewMap = true

    init(routeService: Routing) {
        self.routeService = routeService
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var routeService: Routing

    private lazy var mapViewController: MapViewControllerInterface & UIViewController = {
        if useNewMap {
            let map = NewMapViewController()
            map.delegate = self
            return map
        }
        return MapViewController()
    }()

    private lazy var sheetNavigationController: SheetNavigationController = {
        let sheet = SheetNavigationController()
        sheet.sheetDelegate = self
        return sheet
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        setViewControllers([mapViewController], animated: false)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(sheetNavigationController, animated: true)
    }
}

extension RootNavigationController: NewMapViewControllerDelegate {
    func mapViewController(_: NewMapViewController, didTapPointAt _: Coordinate) {
        /// 1) Отдать Мише
        /// 2) Выбрать MapItem на карте
    }

    func mapViewControler(_: NewMapViewController, didSelect _: MapItem) {
        /// Определить:
        ///  - конец или начало маршрута?
        ///  - первый или второй MapItem
        ///     - если первый:
        ///        1) добавляем в экран маршрута
        ///
        ///     - если второй:
        ///        1) добавляем в экран маршрута
        ///        2) рисуем маршрут
        ///
    }
}

extension RootNavigationController: SheetNavigationControllerDelegate {
    func routeViewControllerDidSelectStartCell() {
        routeService.routeStart = nil

        // Удалить точку старта на карте

        sheetNavigationController.showSearch(with: "Откуда")
    }

    func routeViewControllerDidSelectEndCell() {
        routeService.routeEnd = nil

        // Удалить точку финиша на карте

        sheetNavigationController.showSearch(with: "Куда")
    }

    func routeViewControllerDidChangeRoute() {
        (routeService.routeEnd, routeService.routeStart) = (routeService.routeStart, routeService.routeEnd)

        // Поменять местами точки на карте
    }

    func searchTableViewControllerDidSelect(mapItem: MapItem) {
        /// Определить:
        ///  - конец или начало маршрута?
        ///  - первый или второй MapItem
        ///     - если первый:
        ///        1) добавляем в экран маршрута
        ///        2) отмечаем на карте точку
        ///
        ///     - если второй:
        ///        1) добавляем в экран маршрута
        ///        2) отмечаем на карте точку
        ///        3) рисуем маршрут
        ///

        if routeService.isEmptyRoute {
            routeService.routeEnd = mapItem

            sheetNavigationController.setRouteEnd(mapItem)
            mapViewController.setRouteEnd(mapItem)
            return
        }

        if routeService.hasEnd {
            routeService.routeStart = mapItem

            sheetNavigationController.setRouteEnd(mapItem)
            mapViewController.setRouteStart(mapItem)
        } else {
            routeService.routeEnd = mapItem

            sheetNavigationController.setRouteStart(mapItem)
            mapViewController.setRouteEnd(mapItem)
        }
        mapViewController.drawRoute(start: routeService.routeStart!, end: routeService.routeEnd!)
    }
}
