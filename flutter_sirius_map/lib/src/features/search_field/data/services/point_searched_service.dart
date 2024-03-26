import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_sirius_map/src/features/search_field/data/models/api_point_searched/api_point_searched.dart';

class PointSearchedService {
  final String name;
  late final String _lowerName;
  PointSearchedService({required this.name}) {
    _lowerName = name.toLowerCase();
  }

  late List<ApiPointSearched> _pointsSearched;

  Future<List<ApiPointSearched>> get _getPontByName async {
    if (_pointsSearched.isEmpty) {
      await _loadPoints();
    }
    if (name.isEmpty) {
      _pointsSearched = _points;
    } 
    else
    {
      for (ApiPointSearched point in _points) {
        String lowerPointName = point.name.toLowerCase();
        if(lowerPointName.contains(_lowerName)){
          _pointsSearched.add(point);
        }
      }
    }
    return _pointsSearched;
  }

  static const _path = r'flutter_sirius_map\assets\points\name_to_id.json';

  List<ApiPointSearched> _points = [];

  Future<void> _loadPoints() async {
    File jsonFile = File(_path);
    String jsonString = jsonFile.readAsStringSync();
    List<dynamic> jsonList = json.decode(jsonString);
    List<ApiPointSearched> _points =
        jsonList.map((json) => ApiPointSearched.fromJson(json)).toList();
  }

}
