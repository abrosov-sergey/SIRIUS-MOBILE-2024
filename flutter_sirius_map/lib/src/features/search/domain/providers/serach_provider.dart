import 'package:flutter_sirius_map/src/features/search/data/providers/point_searched_repository.dart';
import 'package:flutter_sirius_map/src/features/search/domain/entities/point_searched_entity/point_searched.dart';
import 'package:flutter_sirius_map/src/features/search/domain/states/search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'serach_provider.g.dart';

@riverpod
class SearchStateNotifier extends _$SearchStateNotifier {
  @override
  SearchState build() {
    return const StartSearch();
  }

  String pointName = "";
  late final PointSearchedRepositoryImpl _pointSearchedRepository;
  final List<PointSearched> pointSearched = [];

  void loadSearc() {
    if (state is StartSearch) {
      _pointSearchedRepository = ref.read(pointSearchedRepositoryProvider);
      _pointSearchedRepository.loadPoints().then((_) {
        state = const LoadindPoints();
      });
    }
  }

  void updateName(String name) {
    pointName = name;
    loadSearc();
    onSearchTab();
  }

  void onSearchTab() {
    if (state is LoadindPoints) {
      state = LoadedPoint(points: _pointSearchedRepository.getPoints());
    }
  }

  void filterPoints() {}

  List<PointSearched> searchPoint() {
    if (state is LoadedPoint) {
      final curState = state as LoadedPoint;
      pointSearched.clear();
      for (PointSearched point in curState.points) {
        if (point.name.toLowerCase().contains(pointName)){
          pointSearched.add(point);
        }
      }
    }
    return pointSearched;
  }
}
