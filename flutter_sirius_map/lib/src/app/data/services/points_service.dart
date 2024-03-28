import 'package:flutter_sirius_map/src/app/data/services/dist.dart';
import 'package:flutter_sirius_map/src/app/data/services/loaders/points_loader.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

class PointsService {
  final PointsLoader _pointsLoader;
  PointsService({required PointsLoader pointsLoader})
      : _pointsLoader = pointsLoader;

  bool containsId(int id) => _pointsLoader.pointsById.containsKey(id);

  /// получение точки по ее id, если не нашлась - null
  PlacePoint? getById(int id) {
    final points = _pointsLoader.pointsById;
    if (containsId(id)) {
      return PlacePoint(id: id, pos: points[id]!);
    }
    return null;
  }

  final _maxPointsDist = 0.001;
  /// возвращает ближайшую к данным координатам точку
  /// если отсутсвуют какие-либо точки, выкинет ошибку
  PlacePoint? getClosest(LatLng ll) {
    final points = _pointsLoader.pointsById;

    PlacePoint? ans;
    for (final entry in points.entries) {
      final distOld = ans == null ? null : dist(ll, ans.pos);
      final distNew = dist(ll, entry.value);
      if (distOld == null || distOld > distNew) {
        if (distNew <= _maxPointsDist) {
          ans = PlacePoint(id: entry.key, pos: entry.value);
        }
      }
    }
    
    return ans;
  }
}
