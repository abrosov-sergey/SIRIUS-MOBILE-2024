import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

class PointsLoader {
  /// точки, храним оптимизированно для обращения по индексу
  late Map<int, PlacePoint> pointsById;

  /// подгрузка и декодинг координат точек
  static const _pointsPath = 'assets/points/anchor.geojson';
  Future<void> init() async {
    final json = await rootBundle.loadString(_pointsPath);
    final info = jsonDecode(json);

    pointsById = <int, PlacePoint>{};

    for (final line in info) {
      int id = line['id'];
      double lat = line['coordinates'][1];
      double lng = line['coordinates'][0];
      String? name = line['title'];
      final ll = LatLng(lat, lng);

      pointsById[id] = PlacePoint(id: id, pos: ll, name: name);
    }
  }
}
