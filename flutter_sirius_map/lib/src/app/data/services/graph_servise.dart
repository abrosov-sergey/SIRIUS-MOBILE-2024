import 'package:flutter/foundation.dart';
import 'package:flutter_sirius_map/src/app/data/services/dijkstra.dart';
import 'package:flutter_sirius_map/src/app/data/services/loaders/graph_loader.dart';
import 'package:flutter_sirius_map/src/app/data/services/points_service.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';

class GraphServise {
  final GraphLoader _graphLoader;
  final PointsService _pointsService;

  GraphServise({
    required PointsService pointsService,
    required GraphLoader graphLoader,
  })  : _graphLoader = graphLoader,
        _pointsService = pointsService;

  /// получение маршрута с помощью дейкстры
  List<PlacePoint>? getRoute(PlacePoint start, PlacePoint finish) {
    final graph = _graphLoader.graph;

    List<int> tempRoute;
    try {
      tempRoute = Dijkstra.findPathFromGraph(graph, start.id, finish.id)
          .map((e) => e as int)
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('error while dijkstra: $e');
      }
      return null;
    }
    List<PlacePoint> resRoute = [];

    resRoute = tempRoute
        .where((id) => _pointsService.containsId(id))
        .map((id) => _pointsService.getById(id)!)
        .toList();

    return resRoute.isEmpty ? null : resRoute;
  }
}
