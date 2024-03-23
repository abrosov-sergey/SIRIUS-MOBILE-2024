import 'package:flutter_sirius_map/src/features/project_map/data/map_cache_realisation.dart';
import 'package:flutter_sirius_map/src/features/project_map/domain/states/map_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  MapState build(MapCacheDB mapCache) {
    return const MapState.loading();
  }

  void tryLoadPath() {
    mapCache.getPath().then(_gotPath).onError(_onError);
    state = const MapState.loading();
  }

  void _gotPath(String path) {
    state = MapState.pathLoaded(cachePath: path, route: []);
  }

  void _onError(Object? error, StackTrace stackTrace) {
    if (error != null) {
      // ignore: avoid_print
      print(error);
    }
    state = MapState.error(error?.toString());
  }
}
