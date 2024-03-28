//
//  RouteService.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 27.03.2024.
//

import Collections
import Foundation
import MapKit

/// API for RouteService
public protocol PathFinderProtocol {
    func setGraph(graph: Graph)
    func getClosetItem(for coordinate: Coordinate) -> MapItem
    func getRoute(start: MapItem, end: MapItem) -> Route
}

/// Service for building a route
public final class RouteService {
    public typealias Neighbours = [(indx: Int, dist: Double)]
    public typealias Edges = [Int: Neighbours]

    public static let shared = RouteService()

    private static let url = Bundle.main.url(forResource: "anchor_formatted_for_egor", withExtension: "json")!
    private static let data = try! Data(contentsOf: RouteService.url)
    static let mapItems = try! JSONDecoder().decode([Anchor].self, from: RouteService.data).map { $0.mapItem }
    private static var edges: RouteService.Edges = [:]
    private static var itemsByIndex: [Int: MapItem] = [:]

    private init() {
        setGraph(graph: Graph(mapItems: Self.mapItems))
    }
}

extension RouteService: PathFinderProtocol {
    public func setGraph(graph: Graph) {
        for item in graph.mapItems {
            RouteService.itemsByIndex[item.id] = item
        }
        for (index, neighbours) in graph.edges {
            RouteService.edges[index] = []

            for neigour in neighbours {
                RouteService.edges[index]!.append(
                    (
                        RouteService.itemsByIndex[neigour]!.id,
                        getEdgeLength(
                            firstCoordinate: RouteService.itemsByIndex[index]!.coordinate,
                            secondCoordinate: RouteService.itemsByIndex[neigour]!.coordinate
                        )
                    )
                )

                if RouteService.edges[neigour] == nil {
                    RouteService.edges[neigour] = []
                }

                RouteService.edges[neigour]!.append(
                    (
                        RouteService.itemsByIndex[index]!.id,
                        getEdgeLength(
                            firstCoordinate: RouteService.itemsByIndex[index]!.coordinate,
                            secondCoordinate: RouteService.itemsByIndex[neigour]!.coordinate
                        )
                    )
                )
            }
        }
    }

    public func getClosetItem(for coordinate: Coordinate) -> MapItem {
        var closest: MapItem?
        for (_, item) in RouteService.itemsByIndex {
            if closest == nil {
                closest = item
            } else if getEdgeLength(firstCoordinate: closest!.coordinate, secondCoordinate: coordinate) >
                getEdgeLength(firstCoordinate: item.coordinate, secondCoordinate: coordinate)
            {
                closest = item
            }
        }
        return closest!
    }

    public func getRoute(start: MapItem, end: MapItem) -> Route {
        let s = start.id
        let f = end.id

        var closest = Heap<PointDistance>([PointDistance(distance: 0, index: s)])
        var distance: [Int: Double] = [s: 0.0]
        var from: [Int: Int] = [s: s]

        func get_distance(_ index: Int) -> Double {
            distance[index] ?? Constants.longDistance
        }

        while !closest.isEmpty {
            let starter: PointDistance = closest.popMin()!
            if starter.index == f {
                break
            }

            for vertex in RouteService.edges[starter.index] ?? [] {
                if get_distance(vertex.indx) > get_distance(starter.index) + vertex.dist {
                    distance[vertex.indx] = get_distance(starter.index) + vertex.dist
                    from[vertex.indx] = starter.index
                    closest.insert(PointDistance(distance: get_distance(vertex.indx), index: vertex.indx))
                }
            }
        }
        var curr = f
        var validPath: [MapItem] = [RouteService.itemsByIndex[curr]!]

        while s != curr {
            curr = from[curr]!
            validPath.append(RouteService.itemsByIndex[curr]!)
        }
        validPath.reverse()
        return Route(path: validPath, eta: get_distance(f))
    }
}

extension RouteService {
    /// Getting edge length between two coordinates
    private func getEdgeLength(firstCoordinate: Coordinate, secondCoordinate: Coordinate) -> Double {
        let firstLat = firstCoordinate.latitude
        let secondLat = secondCoordinate.latitude

        let firstLon = firstCoordinate.longitude
        let secondLon = secondCoordinate.longitude

        let firstPhi = firstLat * Double.pi / 180.0
        let secondPhi = secondLat * Double.pi / 180.0

        let deltaPhi = (secondLat - firstLat) * Double.pi / 180.0
        let deltaLam = (secondLon - firstLon) * Double.pi / 180.0

        let firstParam = sin(deltaPhi / 2) * sin(deltaPhi / 2) + cos(firstPhi) * cos(secondPhi) * sin(deltaLam / 2) * sin(deltaLam / 2)
        let secondParam = 2 * atan2(sqrt(firstParam), sqrt(1 - firstParam))

        let answer = Constants.R * secondParam

        return answer
    }
}
