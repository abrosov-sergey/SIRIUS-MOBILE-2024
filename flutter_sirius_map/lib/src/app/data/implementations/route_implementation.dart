import 'package:flutter_sirius_map/src/app/data/repositories/route_repository.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

class RouteImplementation implements RouteRepository {
  @override
  Future<PlacePoint> getClosestPoint(LatLng point) {
    // TODO: implement getClosestPoint
    throw UnimplementedError();
  }

  @override
  Future<List<PlacePoint>> getRoute(PlacePoint start, PlacePoint finish) {
    // TODO: implement getRoute
    throw UnimplementedError();
  }

}