//
//  Route.swift
//  SiriusMap
//
//  Created by Sergey Abrosov on 27.03.2024.
//

import Foundation
import MapKit
import Collections

let url = Bundle.main.url(forResource: "anchor_formatted_for_egor", withExtension: "json")!
let data = try! Data(contentsOf: url)
let mapItems = try! JSONDecoder().decode([Anchor].self, from: data).map { $0.mapItem }

typealias Neighbours = [(indx : Int, dist : Double)]
typealias Edges = Dictionary<Int, Neighbours>

protocol PathFinderProtocol {
    init(graph: Graph)
    func item(for coordinate: Coordinate) -> MapItem
    func route(start: MapItem, end: MapItem) -> Route
}

struct PointDistance: Comparable {
    static func < (lhs: PointDistance, rhs: PointDistance) -> Bool {
        return lhs.distance < rhs.distance
    }
    let distance: Double
    let index: Int
}

struct PathFinder: PathFinderProtocol {
    
    private var edges: Edges = [:]
    private var ItemsbyIndex: Dictionary<Int, MapItem> = [:]
    
    init(graph: Graph) {
        for item in graph.mapItems {
            ItemsbyIndex[item.id] = item
        }
        for (index, neighbours) in graph.edges {
            edges[index] = []
            for neigour in neighbours {
                edges[index]!.append((ItemsbyIndex[neigour]!.id, distance_of_edge(ItemsbyIndex[index]!.coordinate, ItemsbyIndex[neigour]!.coordinate)))
                if edges[neigour] == nil { edges[neigour] = [] }
                edges[neigour]!.append((ItemsbyIndex[index]!.id, distance_of_edge(ItemsbyIndex[index]!.coordinate, ItemsbyIndex[neigour]!.coordinate)))
            }
        }
    }
    
    private func distance_of_edge(_ cords1: Coordinate, _ cords2: Coordinate) -> Double {
        
        let lat1 = cords1.latitude;
        let lat2 = cords2.latitude;
        let lon1 = cords1.longitude;
        let lon2 = cords2.longitude;
        
        let phi1 = lat1 * Double.pi / 180;
        let phi2 = lat2 * Double.pi / 180;
        
        let dphi = (lat2-lat1) * Double.pi/180;
        let dlam = (lon2-lon1) * Double.pi/180;
        
        let a = sin(dphi / 2) * sin(dphi / 2) + cos(phi1) * cos(phi2) * sin(dlam / 2) * sin(dlam / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a));
        let d = Constants.R * c;
        return d;
    }
    
    func item(for coordinate: Coordinate) -> MapItem {
        var closest : MapItem?
        for (_, item) in ItemsbyIndex {
            if closest == nil {
                closest = item
            } else if distance_of_edge(closest!.coordinate, coordinate) > distance_of_edge(item.coordinate, coordinate) {
                closest = item
            }
        }
        return closest!
    }
    
    func route(start: MapItem, end: MapItem) -> Route {
        
        let s = start.id
        let f = end.id
        
        var closest = Heap<PointDistance>([PointDistance(distance: 0, index: s)])
        var visited = Set<Int>([s])
        var distance : Dictionary<Int, Double> = [s : 0.0]
        var from : Dictionary<Int, Int> = [s:s]
        
        func get_distance(_ index : Int) -> Double {
            return distance[index] ?? Constants.longDistance
        }
        
        for _ in 0..<ItemsbyIndex.count {
            let starter : PointDistance = closest.popMax()!
            print(starter.index)
            visited.insert(starter.index)
            for vertex in edges[starter.index] ?? [] {
                if !visited.contains(vertex.indx) {
                    print(vertex.dist)
                    if (get_distance(vertex.indx) > get_distance(starter.index) + vertex.dist) {
                        distance[vertex.indx] = get_distance(starter.index) + vertex.dist
                        from[vertex.indx] = starter.index
                        closest.insert(PointDistance(distance: get_distance(vertex.indx), index: vertex.indx))
                    }
                }
            }
        }
        var curr = f
        var validPath : [MapItem] = [ItemsbyIndex[curr]!]
        
        while s != curr {
            curr = from[curr]!
            validPath.append(ItemsbyIndex[curr]!)
        }
        validPath.reverse()
        return Route(path: validPath, eta: get_distance(f))
    }
}

var pathfinder = PathFinder(graph: Graph(mapItems: [
    MapItem(id: 1, title: nil, coordinate: Coordinate(latitude: 43.41460541857027, longitude: 39.95023375215944)),
    MapItem(id: 2, title: nil, coordinate: Coordinate(latitude: 43.41407852696078, longitude: 39.95026771017814)),
    MapItem(id: 3, title: nil, coordinate: Coordinate(latitude: 43.41407951363843, longitude: 39.950976754041626)),
    MapItem(id: 4, title: nil, coordinate: Coordinate(latitude: 43.41449786992129, longitude: 39.9509889789358)),
    MapItem(id: 5, title: nil, coordinate: Coordinate(latitude: 43.41432322627096, longitude: 39.95049319153931))
], edges: [
    2 : [3],
    3 : [4],
    4 : [5, 1],
    5 : [1],
]))
