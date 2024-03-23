import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';

class ProjectMap extends StatefulWidget {
  const ProjectMap({super.key});

  @override
  State<ProjectMap> createState() => _ProjectMapState();
}

class _ProjectMapState extends State<ProjectMap> {
  get _marshrut => const [
        LatLng(43.41482521465457, 39.951312004328557),
        LatLng(43.414671691690607, 39.951024080506684),
        LatLng(43.416017675651091, 39.953505467745707),
        LatLng(43.412741314440822, 39.949842052848332),
      ];

  final _maxPoint = const LatLng(43.412678630221023, 39.949135833185039);
  final _minPoint = const LatLng(43.41601767565109, 39.953505467745707);

  get _center => LatLng(
        (_maxPoint.latitude + _minPoint.latitude) / 2,
        (_maxPoint.longitude + _minPoint.longitude) / 2,
      );

  LatLngBounds _bounds() {
    // вертикальный отступ больше, чтобы с вертикальной ореинтацией было удобнее визуально
    final latChange = _maxPoint.latitude - _minPoint.latitude;
    final lngChange = (_maxPoint.longitude - _minPoint.longitude) / 2;
    final latMax = _maxPoint.latitude + latChange;
    final latMin = _minPoint.latitude - latChange;
    final lngMax = _maxPoint.longitude + lngChange;
    final lngMin = _minPoint.longitude - lngChange;

    return LatLngBounds(LatLng(latMax, lngMax), LatLng(latMin, lngMin));
  }

  late String _path = '';

  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        cameraConstraint: CameraConstraint.contain(bounds: _bounds()),
        maxZoom: 20,
        minZoom: 17,
        initialCenter: _center,
        initialZoom: 17,
        onTap: (TapPosition tapPosition, LatLng point) {
          // ignore: avoid_print
          print("${tapPosition.toString()}   -   ${point.toString()}");
        },
      ),
      children: [
        // убрать карту когда будет готова картинка
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.flutter_map_example',
          tileProvider: CachedTileProvider(
            // maxStale keeps the tile cached for the given Duration and
            // tries to revalidate the next time it gets requested
            maxStale: const Duration(days: 30),
            store: DbCacheStore(
              databaseName: 'mapCache',
              databasePath: _path,
            ),
          ),
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: _marshrut,
              gradientColors: [Colors.blue, Colors.purple, Colors.pink],
              strokeWidth: 10,
            ),
          ],
        ),
      ],
    );
  }
}
