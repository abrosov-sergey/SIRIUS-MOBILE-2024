import 'dart:math';

import 'package:latlong2/latlong.dart';

/// расстояние между точками
double dist(LatLng l1, LatLng l2) {
  return sqrt(
      pow(l1.latitude - l2.latitude, 2) + pow(l1.longitude - l2.longitude, 2));
}
