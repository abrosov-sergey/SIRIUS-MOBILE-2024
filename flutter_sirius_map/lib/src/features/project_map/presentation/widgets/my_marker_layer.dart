import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

@immutable
class MyMarkerLayer extends StatelessWidget {
  final List<Marker> markers;

  /// Alignment of each marker relative to its normal center at [Marker.point]
  ///
  /// For example, [Alignment.topCenter] will mean the entire marker widget is
  /// located above the [Marker.point].
  ///
  /// The center of rotation (anchor) will be opposite this.
  ///
  /// Defaults to [Alignment.center]. Overriden by [Marker.alignment] if set.
  final Alignment alignment;

  /// Whether to counter rotate markers to the map's rotation, to keep a fixed
  /// orientation
  ///
  /// When `true`, markers will always appear upright and vertical from the
  /// user's perspective. Defaults to `false`. Overriden by [Marker.rotate].
  ///
  /// Note that this is not used to apply a custom rotation in degrees to the
  /// markers. Use a widget inside [Marker.builder] to perform this.
  final bool rotate;

  const MyMarkerLayer({
    super.key,
    required this.markers,
    this.alignment = Alignment.center,
    this.rotate = false,
  });

  @override
  Widget build(BuildContext context) {
    final map = MapCamera.of(context);

    return MobileLayerTransformer(
      child: Stack(
        // ignore: avoid_types_on_closure_parameters
        children: (List<Marker> markers) sync* {
          for (final m in markers) {
            // Resolve real alignment
            final left = 0.5 * m.width * ((m.alignment ?? alignment).x + 1);
            final top = 0.5 * m.height * ((m.alignment ?? alignment).y + 1);
            final right = m.width - left;
            final bottom = m.height - top;

            // Perform projection
            final pxPoint = map.project(m.point);

            // Cull if out of bounds
            if (!map.pixelBounds.containsPartialBounds(
              Bounds(
                Point(pxPoint.x + left, pxPoint.y - bottom),
                Point(pxPoint.x - right, pxPoint.y + top),
              ),
            )) continue;

            // Apply map camera to marker position
            final pos = pxPoint.subtract(map.pixelOrigin);

            yield Positioned(
              key: m.key,
              left: pos.x - right,
              top: pos.y - bottom,
              child: (m.rotate ?? rotate)
                  ? Transform.rotate(
                      angle: -map.rotationRad,
                      alignment: (m.alignment ?? alignment) * -1,
                      child: m.child,
                    )
                  : m.child,
            );
          }
        }(markers)
            .toList(),
      ),
    );
  }
}
