import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  List<LatLng> build() {
    final appState = ref.watch(appStateNotifierProvider);
    if (appState is RouteBuilderLoaded) {
      return (appState).route.map((e) => e.pos).toList();
    }
    if (appState is RouteAppState) {
      return (appState).route.map((e) => e.pos).toList();
    }
    return [];
  }

  void onMapTap(LatLng ll) {
    final appStateNotifier = ref.read(appStateNotifierProvider.notifier);
    appStateNotifier.onMapTap(ll);
  }
}
