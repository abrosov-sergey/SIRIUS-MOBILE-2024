import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  List<LatLng> build() {
    ref.watch(appProvider);
    return [];
  }
}
