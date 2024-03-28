import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';

class PointsLoader {
  /// точки, храним оптимизированно для обращения по индексу
  late Map<int, LatLng> pointsById;

  /// подгрузка и декодинг координат точек
  static const _pointsPath = 'assets/points/positions.geojson';
  Future<void> init() async {
    final json = await rootBundle.loadString(_pointsPath);
    final info = jsonDecode(json)['features'];

    pointsById = <int, LatLng>{};

    for (final line in info) {
      int id = line['properties']['id'];
      double lat = line['geometry']['coordinates'][0][1];
      double lng = line['geometry']['coordinates'][0][0];
      final ll = LatLng(lat, lng);

      pointsById[id] = ll;
    }
  }
}
