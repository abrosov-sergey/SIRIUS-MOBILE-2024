import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/search/domain/entities/point_searched_entity/point_searched.dart';
import 'package:flutter_sirius_map/src/features/search/domain/repositories/point_searched_repository_interface.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:convert';

final pointSearchedRepositoryProvider = Provider((ref) {
  return PointSearchedRepositoryImpl();
});

class PointSearchedRepositoryImpl implements PointSearchedRepositoryInterface {
  PointSearchedRepositoryImpl();

  List<PointSearched> points = [];

  static const _path = 'assets/points/name_to_id.json';

  @override
  List<PointSearched> getPoints() {
    return points;
  }

  @override
  Future<void> loadPoints() async {
    String jsonString = await rootBundle.loadString(_path);
    List<dynamic> jsonList = json.decode(jsonString);
    points = jsonList.map((json) => PointSearched.fromJson(json)).toList();
  }
}
