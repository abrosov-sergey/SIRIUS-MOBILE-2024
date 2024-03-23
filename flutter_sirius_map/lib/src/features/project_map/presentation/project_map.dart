import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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

  get _center => const LatLng(
        (43.41601767565109 + 43.412678630221023) / 2,
        (39.953505467745707 + 39.949135833185039) / 2,
      );

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.pinchZoom |
              InteractiveFlag.doubleTapZoom |
              InteractiveFlag.doubleTapDragZoom,
        ),
        initialCenter: _center,
        initialZoom: 17,
        onTap: (TapPosition tapPosition, LatLng point) {
          // ignore: avoid_print
          print("${tapPosition.toString()}   -   ${point.toString()}");
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.flutter_map_example',
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
