import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/settings/presentation/controllers/theme_controller.dart';

class BackgroundMap extends ConsumerWidget {
  final String cachePath;
  const BackgroundMap({
    required this.cachePath,
    super.key,
  });

  final _lightMapUrl =
      'https://tiles-eu.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}@2x.png';
  final _lightMapCache = 'lightMapCache';

  final _darkMapUrl =
      'https://tiles-eu.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}@2x.png';
  final _darkMapCache = 'darkMapCache';

  final _apiKey = '84aaae22-a6f0-45d7-b5b9-878a0247754d';

  String _mapUrl(bool light) {
    return '${light ? _lightMapUrl : _darkMapUrl}?api_key={api_key}';
  }

  @override
  Widget build(context, ref) {
    final isLight = ref.watch(themeProvider) == ThemeState.light;
    return TileLayer(
      urlTemplate: _mapUrl(isLight),
      additionalOptions: {
        "api_key": _apiKey,
      },
      userAgentPackageName: 'com.example.flutter_map_example',
      tileProvider: CachedTileProvider(
        // maxStale keeps the tile cached for the given Duration and
        // tries to revalidate the next time it gets requested
        maxStale: const Duration(days: 30),
        store: DbCacheStore(
          databaseName: isLight ? _lightMapCache : _darkMapCache,
          databasePath: cachePath,
        ),
      ),
    );
  }
}
