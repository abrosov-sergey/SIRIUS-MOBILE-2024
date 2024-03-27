import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/search/data/providers/point_searched_repository.dart';
import 'package:flutter_sirius_map/src/features/search/domain/entities/point_searched_entity/point_searched.dart';


final nameProvider = StateProvider<String>((ref)=>"");

final serchedListProvider = StateNotifierProvider((ref){
    final String namePoint = ref.watch(nameProvider).toLowerCase();
    Future<List<PointSearched>> points =  ref.watch(pointSearchedRepositoryProvider);
    List<PointSearched> loadedPoints = [];
    List<PointSearched> searchedPoints = [];
    points.then((value) {
      value.forEach((item) => loadedPoints.add(item));
    });
    for(PointSearched loadedPoint in loadedPoints){
      String lowerPointName = loadedPoint.name.toLowerCase(); 
      if(lowerPointName.contains(namePoint)){
        searchedPoints.add(loadedPoint);
      }
    }
    return searchedPoints;
  }
);

