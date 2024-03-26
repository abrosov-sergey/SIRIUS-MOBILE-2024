/*import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter_sirius_map/src/features/search_field/domain/models/point_searched_model/point_searched.dart';

class PointSearchedService{
  
  PointSearchedService(){}
  Map<String,int>? _pointSearched;

  Future<Map<String,int>> get _getPontByName async {
    if( _pointSearched == null ){
      await _loadPoints();
    }
    return _pointSearched!;
  }

  static const _path =  r'flutter_sirius_map\assets\points\name_to_id.json';

  Future<void>  _loadPoints() async{
    final points = (await File(_path));
  }
}*/