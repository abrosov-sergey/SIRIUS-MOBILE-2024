import 'dart:io';

import 'package:flutter_sirius_map/src/app/data/services/dist.dart';
import 'package:flutter_sirius_map/src/app/data/services/loaders/points_loader.dart';

class GraphLoader {
  PointsLoader pointsLoader;

  GraphLoader(this.pointsLoader);

  late Map<int, Map<int, double>> graph;

  /// подгрузка графа + подсчет длины ребер
  final String _graphPath = r'flutter_sirius_map\assets\points\Graph.txt';
  Future<void> init() async {
    // для графа сразу нужны расстояния между точками
    final points = pointsLoader.pointsById;

    List<String> lines = await File(_graphPath).readAsLines();

    graph = <int, Map<int, double>>{};
    for (var line in lines) {
      final lineParsed = line.split(' :').map((e) => int.parse(e)).toList();
      final v = lineParsed[0];
      for (int i = 1; i < lineParsed.length; i++) {
        final u = lineParsed[i];
        if (points[v] == null || points[u] == null) {
          continue;
        }

        final pointsDist = dist(points[v]!, points[u]!);

        graph[v] ??= <int, double>{};
        graph[v]![u] = pointsDist;

        graph[u] ??= <int, double>{};
        graph[u]![v] = pointsDist;
      }
    }
  }
}
