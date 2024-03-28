import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:flutter_sirius_map/src/features/project_map/domain/models/map_state.dart';
import 'package:flutter_sirius_map/src/features/project_map/domain/providers/map_provider.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/widgets/background_map.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/widgets/my_marker_layer.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/widgets/selected_point.dart';
import 'package:latlong2/latlong.dart';

class ProjectMap extends ConsumerWidget {
  const ProjectMap({super.key});

  // ignore: unused_element
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

  @override
  Widget build(context, ref) {
    final mapNotifier = ref.watch(mapNotifierProvider.notifier);
    final mapState = ref.watch(mapNotifierProvider);

    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        cameraConstraint: CameraConstraint.contain(bounds: _bounds()),
        maxZoom: 20,
        minZoom: 17,
        initialCenter: _center,
        initialZoom: 17,
        onTap: (TapPosition tapPosition, LatLng point) {
          // print('onMapTap - Widget');
          mapNotifier.onMapTap(point);
        },
      ),
      children: [
        // убрать карту когда будет готова картинка (????)
        const BackgroundMap(),
        OverlayImageLayer(overlayImages: [
          OverlayImage(
              imageProvider: const AssetImage('assets/images/sirius_plan.png'),
              bounds: LatLngBounds(
                  const LatLng(43.41601767565109, 39.953505467745707),
                  const LatLng(43.412678630221023, 39.949135833185039)))
        ]),
        // отрисовка маршрута
        if (mapState is MapStateRoute)
          PolylineLayer(
            polylines: [
              Polyline(
                points: mapState.route,
                gradientColors: [Colors.blue, Colors.purple, Colors.pink],
                strokeWidth: 10,
              ),
            ],
          ),
        if (mapState is MapStatePoints)
          MyMarkerLayer(markers: [
            if (mapState.start != null)
              _marker(
                mapState.start!,
                mapNotifier.onPointCancel,
              ),
            if (mapState.finish != null)
              _marker(
                mapState.finish!,
                mapNotifier.onPointCancel,
              ),
          ]),
      ],
    );
  }

  Marker _marker(PlacePoint placePoint, void Function(int) deletePoint) {
    return Marker(
      point: placePoint.pos,
      child: SelectedPoint(
        placePoint: placePoint,
        deletePoint: deletePoint,
      ),
    );
  }
}
