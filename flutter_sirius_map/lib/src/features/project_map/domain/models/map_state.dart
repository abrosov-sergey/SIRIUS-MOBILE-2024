import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

sealed class MapState {
  const MapState();
}

class MapStatePoints extends MapState {
  final PlacePoint? start;
  final PlacePoint? finish;
  const MapStatePoints({
    this.start,
    this.finish,
  });

  MapStatePoints copyWith({
    PlacePoint? start,
    PlacePoint? finish,
  }) =>
      MapStatePoints(
        start: start ?? this.start,
        finish: finish ?? this.finish,
      );
}

class MapStateRoute extends MapState {
  final List<LatLng> route;
  const MapStateRoute(this.route);
}
