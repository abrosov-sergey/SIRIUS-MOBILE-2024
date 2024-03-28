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

struct RouteService: Routing {
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

final class RootNavigationController: UINavigationController {
    
    init(routeService: Routing) {
        self.routeService = routeService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let routeService: Routing
    
    private lazy var mapViewController: NewMapViewController = {
        let map = NewMapViewController()
        map.delegate = self
        return map
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
    func mapViewController(_ mapViewController: NewMapViewController, didTapPointAt location: Coordinate) {
        
        /// 1) Отдать Мише
        /// 2) Выбрать MapItem на карте
    }
    
    func mapViewControler(_ mapViewController: NewMapViewController, didSelect mapItem: MapItem) {
        
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
            
            // TODO: - Показать экран маршрута
            sheetNavigationController.setRouteEnd(mapItem)
            mapViewController.setRouteEnd(mapItem)
            return
        }
        
        if routeService.hasEnd {
            sheetNavigationController.setRouteEnd(mapItem)
            mapViewController.setRouteStart(mapItem)
        } else {
            sheetNavigationController.setRouteStart(mapItem)
            mapViewController.setRouteEnd(mapItem)
        }
        mapViewController.drawRoute()
    }
}
