import 'package:flutter_sirius_map/src/features/search/domain/entities/point_searched_entity/point_searched.dart';

abstract class PointSearchedRepositoryInterface {

  Future<List<PointSearched>> getPoints();
}