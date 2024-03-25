import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/db_cache_provider/db_cache_provider.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/providers/theme_provider.dart';

class BackgroundMap extends ConsumerWidget {
  const BackgroundMap({
    super.key,
  });

  final _lightMapUrl =
      'https://tiles-eu.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}@2x.png';

  final _darkMapUrl =
      'https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}@2x.png';

  final _apiKey = '84aaae22-a6f0-45d7-b5b9-878a0247754d';

  String _mapUrl(bool light) {
    return '${light ? _lightMapUrl : _darkMapUrl}?api_key={api_key}';
  }

  @override
  Widget build(context, ref) {
    final dbCache = ref.watch(dBCacheProvider);

    if (!dbCache.hasValue) {
      return const GridPaper();
    }
    
    final isLight = !ref.watch(themeProvider).isDarkTheme;

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
        store: dbCache.value!
      ),
    );
  }
}
