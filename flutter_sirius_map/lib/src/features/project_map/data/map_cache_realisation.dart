import 'package:flutter_sirius_map/src/features/project_map/data/map_cache_interface.dart';
import 'package:path_provider/path_provider.dart';

class MapCacheDB implements MapCache{
  @override
  Future<String> getPath() async {
    final cacheDirectory = await getTemporaryDirectory();
    return cacheDirectory.path;
  }
}