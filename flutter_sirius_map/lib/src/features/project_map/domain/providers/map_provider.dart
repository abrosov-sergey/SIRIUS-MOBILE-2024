import 'package:flutter_sirius_map/src/features/project_map/data/map_cache_interface.dart';
import 'package:flutter_sirius_map/src/features/project_map/data/map_cache_realisation.dart';
import 'package:flutter_sirius_map/src/features/project_map/domain/states/map_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

final mapNotifierProviderDB = mapNotifierProvider.call(const MapCacheDB());

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  Future<MapState> build(MapCache mapCache) async {
    return MapState(cachePath: await mapCache.getPath(), route: []);
  }
}
