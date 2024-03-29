//
//  MapItem.swift
//  SiriusMap
//
//  Created by Egor on 21.03.2024.
//

#if DEBUG
    extension MapItem {
        static let sampleData = [
            MapItem(id: 0, title: nil, coordinate: Coordinate(latitude: 43.414390231912478, longitude: 39.950388503984989)),
            MapItem(id: 1, title: nil, coordinate: Coordinate(latitude: 43.414417909921923, longitude: 39.95070036288903)),
            MapItem(id: 2, title: nil, coordinate: Coordinate(latitude: 43.414609511933413, longitude: 39.950707851600782)),
            MapItem(id: 3, title: nil, coordinate: Coordinate(latitude: 43.414590480110249, longitude: 39.951024080506684)),
            MapItem(id: 4, title: nil, coordinate: Coordinate(latitude: 43.414930900526763, longitude: 39.951275248095982)),
        ]
//        "Вход", "Финтех ЦИТ", "Умный город", "Ресторан Вега", "Библиотека", "Туалет",
//        "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110"
//    ].map(MapItem.init)
    }
#endif

// private var route: Route? = Route(eta: 3.0, path: [
//    MapItem(title: nil, coordinate: Coordinate(latitude: 43.414390231912478, longitude: 39.950388503984989), id: 0),
//    MapItem(title: nil, coordinate: Coordinate(latitude: 43.414417909921923, longitude: 39.95070036288903), id: 1),
//    MapItem(title: nil, coordinate: Coordinate(latitude: 43.414609511933413, longitude: 39.950707851600782), id: 2),
//    MapItem(title: nil, coordinate: Coordinate(latitude: 43.414590480110249, longitude: 39.951024080506684), id: 3),
//    MapItem(title: nil, coordinate: Coordinate(latitude: 43.414930900526763, longitude: 39.951275248095982), id: 4),
// ])

// struct Route {
//    let path: [MapItem]
//    let eta: Double
// }
//
// struct Coordinate {
//    let latitude: Double
//    let longitude: Double
// }
//
// struct MapItem {
//    let title: String?
//    let id: Int
//    let coordinate: Coordinate
// }
//
// protocol PathFinderProtocol {
//    init(mapItems: [MapItem])
//
//    func item(for coordinate: Coordinate) -> MapItem
//    func route(start: MapItem, end: MapItem) -> Route
// }

public struct MapItem {
    var title: String {
        _title ?? String(id)
    }

    let id: Int
    let _title: String?
    let coordinate: Coordinate

    init(id: Int, title: String?, coordinate: Coordinate) {
        self.id = id
        _title = title
        self.coordinate = coordinate
    }
}
