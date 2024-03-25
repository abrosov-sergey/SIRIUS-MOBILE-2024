import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dijkstra/dijkstra.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:latlong2/latlong.dart';

class PointsServise {
  PointsServise() {
    _loadGraph();
  }

  Map<int, LatLng>? _pointsById;

  Future<Map<int, LatLng>> get _getPointsById async {
    if (_pointsById == null) {
      await _loadPoints();
    }
    return _pointsById!;
  }

  static const _path = 'flutter_sirius_map\\assets\\points\\positions.geojson';
  Future<void> _loadPoints() async {
    final json = (await File(_path).readAsString());
    final info = jsonDecode(json)['features'];

    _pointsById = <int, LatLng>{};

    for (final line in info) {
      int id = line['properties']['id'];
      double lat = line['geometry']['coordinates'][0][1];
      double lng = line['geometry']['coordinates'][0][0];
      final ll = LatLng(lat, lng);

      _pointsById![id] = ll;
    }
  }

  Future<PlacePoint?> getById(int id) async {
    final points = await _getPointsById;
    if (points.containsKey(id)) {
      return PlacePoint(id: id, pos: points[id]!);
    }
    return null;
  }

  double _dist(LatLng l1, LatLng l2) {
    return sqrt(pow(l1.latitude - l2.latitude, 2) +
        pow(l1.longitude - l2.longitude, 2));
  }

  Future<PlacePoint> getClosest(LatLng ll) async {
    final points = await _getPointsById;

    PlacePoint? ans;
    for (final entry in points.entries) {
      if (ans == null || _dist(ll, ans.pos) > _dist(ll, entry.value)) {
        ans = PlacePoint(id: entry.key, pos: entry.value);
      }
    }

    if (ans == null) {
      throw Exception('ans is null- probably no points found');
    }
    return ans;
  }

  final String _graphPath = 'flutter_sirius_map\\assets\\points\\Graph.txt';

  Map<int, Map<int, double>>? _graph;

  Future<Map<int, Map<int, double>>> get _getGraph async {
    if (_graph == null) {
      await _loadGraph();
    }
    return _graph!;
  }

  Future<void> _loadGraph() async {
    final points = await _getPointsById;

    List<String> lines = await File(_graphPath).readAsLines();
    _graph = <int, Map<int, double>>{};
    for (var line in lines) {
      final lineParsed = line.split(' :').map((e) => int.parse(e)).toList();
      final v = lineParsed[0];
      for (int i = 1; i < lineParsed.length; i++) {
        final u = lineParsed[i];
        if (points[v] == null || points[u] == null) {
          continue;
        }
        final dist = _dist(points[v]!, points[u]!);
        _graph![v] ??= <int, double>{};
        _graph![v]![u] = dist;

        _graph![u] ??= <int, double>{};
        _graph![u]![v] = dist;
      }
    }
  }

  Future<List<PlacePoint>> getRoute(PlacePoint start, PlacePoint finish) async {
    final graph = await _getGraph;
    final points = await _getPointsById;

    List<int> route;
    try {
      route = Dijkstra.findPathFromGraph(graph, start, finish) as List<int>;
    } catch (e) {
      if (kDebugMode) {
        print('error while dijkstra: $e');
      }
      return [];
    }

    return route.map((id) => PlacePoint(id: id, pos: points[id]!)).toList();
  }
}
