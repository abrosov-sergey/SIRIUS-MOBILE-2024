import 'package:flutter_sirius_map/src/app/data/repositories/route_repository.dart';
import 'package:flutter_sirius_map/src/app/data/servises/points_servise.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

class RouteImplementation implements RouteRepository {
  final PointsServise _pointsServise;

  RouteImplementation({required pointsServise})
      : _pointsServise = pointsServise;

  @override
  Future<PlacePoint> getClosestPoint(LatLng ll) {
    return _pointsServise.getClosest(ll);
  }

  @override
  Future<List<PlacePoint>> getRoute(PlacePoint start, PlacePoint finish) {
    return _pointsServise.getRoute(start, finish);
  }
}
