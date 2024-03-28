import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/data/repositories/route_repository.dart';
import 'package:flutter_sirius_map/src/app/data/services/graph_servise.dart';
import 'package:flutter_sirius_map/src/app/data/services/loaders/graph_loader.dart';
import 'package:flutter_sirius_map/src/app/data/services/loaders/points_loader.dart';
import 'package:flutter_sirius_map/src/app/data/services/points_service.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

final routeRepositoryProvider = Provider((_) => RouteRepositoryImpl());

class RouteRepositoryImpl implements RouteRepository {
  late final PointsService _pointsService;
  late final PointsLoader _pointsLoader;
  late final GraphLoader _graphLoader;
  late final GraphServise _graphService;

  @override
  Future<void> init() async {
    _pointsLoader = PointsLoader();
    await _pointsLoader.init();
    _graphLoader = GraphLoader(_pointsLoader);
    await _graphLoader.init();
    _pointsService = PointsService(pointsLoader: _pointsLoader);
    _graphService =
        GraphServise(graphLoader: _graphLoader, pointsService: _pointsService);
  }

  @override
  PlacePoint? getClosestPoint(LatLng ll) {
    return _pointsService.getClosest(ll);
  }

  @override
  List<PlacePoint> getRoute(PlacePoint start, PlacePoint finish) {
    return _graphService.getRoute(start, finish);
  }
}
