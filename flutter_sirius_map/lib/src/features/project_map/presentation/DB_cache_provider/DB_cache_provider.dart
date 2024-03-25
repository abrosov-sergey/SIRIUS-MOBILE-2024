import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:flutter_sirius_map/src/features/project_map/data/map_cache_interface.dart';
import 'package:flutter_sirius_map/src/features/project_map/data/map_cache_realisation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'DB_cache_provider.g.dart';

final dBCacheProvider = dBCacheNotifierProvider(const MapCacheDB());

@riverpod
class DBCacheNotifier extends _$DBCacheNotifier {
  @override
  Future<DbCacheStore> build(MapCache mapCache) async {
    ref.onDispose(() {
      state.value?.close();
    });
    return DbCacheStore(
      databasePath: await mapCache.getPath(),
      databaseName: 'mapCache',
    );
  }
}
