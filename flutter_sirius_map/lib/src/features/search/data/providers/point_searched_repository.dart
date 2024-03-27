import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/search/domain/entities/point_searched_entity/point_searched.dart';
import 'package:flutter_sirius_map/src/features/search/domain/repositories/point_searched_repository_interface.dart';

import 'dart:io';
import 'dart:async';
import 'dart:convert';



final pointSearchedRepositoryProvider = StateProvider((ref){
  return PointSearchedRepositoryImpl().getPoints();
});




class PointSearchedRepositoryImpl implements PointSearchedRepositoryInterface{
  

  PointSearchedRepositoryImpl();

  //late List<PointSearched> _pointsSearched;

  static const _path = r'flutter_sirius_map\assets\points\name_to_id.json';

  @override
  Future<List<PointSearched>> getPoints() async {
    File jsonFile = File(_path);  
    String jsonString = jsonFile.readAsStringSync();
    List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => PointSearched.fromJson(json)).toList();
  }

  

/*
  @override
  Future<List<PointSearched>> getPointSearchedByName(String name) async {
        if (_pointsSearched.isEmpty) {
      await loadPoints();
    }
    if (name.isEmpty) {
      _pointsSearched = _points;
    } 
    else
    {
      for (PointSearched point in _points) {
        String lowerPointName = point.name.toLowerCase();
        if(lowerPointName.contains(name.toLowerCase())){
          _pointsSearched.add(point);
        }
      }
    }
    return _pointsSearched;
  }



  List<PointSearched> _points = [];

  @override
  Future<void> loadPoints() async {
    File jsonFile = File(_path);
    String jsonString = jsonFile.readAsStringSync();
    List<dynamic> jsonList = json.decode(jsonString);
    List<PointSearched> _points =
        jsonList.map((json) => PointSearched.fromJson(json)).toList();
  }*/

}