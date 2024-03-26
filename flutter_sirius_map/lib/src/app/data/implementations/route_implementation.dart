import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/data/repositories/route_repository.dart';
import 'package:flutter_sirius_map/src/app/data/services/points_service.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

final routeRepositoryProvider =
    Provider((_) => RouteRepositoryImpl(pointsService: pointsServiceProvider));

class RouteRepositoryImpl implements RouteRepository {
  final PointsService _pointsService;

  const RouteRepositoryImpl({required pointsService})
      : _pointsService = pointsService;

  @override
  Future<PlacePoint> getClosestPoint(LatLng ll) {
    return _pointsService.getClosest(ll);
  }

  @override
  Future<List<PlacePoint>> getRoute(PlacePoint start, PlacePoint finish) {
    return _pointsService.getRoute(start, finish);
  }
}
