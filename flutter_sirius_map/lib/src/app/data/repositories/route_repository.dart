import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

abstract class RouteRepository {
  Future<void> init();

  PlacePoint getClosestPoint(LatLng point);

  List<PlacePoint> getRoute(PlacePoint start, PlacePoint finish);
}
