
import 'package:flutter_sirius_map/src/features/search/domain/entities/point_searched_entity/point_searched.dart';

sealed class SearchState {
  const SearchState();
}

class StartSearch extends SearchState{
  const StartSearch();
}

class LoadindPoints extends SearchState{
  const LoadindPoints();
}

class LoadedPoint extends SearchState{
  final List<PointSearched> points;
  const LoadedPoint({required this.points});
}

class ErrorLoad extends SearchState{
  final Object? error;
  final StackTrace? stackTrace;
  const ErrorLoad({this.error, this.stackTrace});
}

