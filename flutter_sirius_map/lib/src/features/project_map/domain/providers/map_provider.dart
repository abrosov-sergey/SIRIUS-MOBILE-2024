import 'package:flutter/foundation.dart';
import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';
import 'package:flutter_sirius_map/src/features/project_map/domain/models/map_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  MapState build() {
    final appState = ref.watch(appStateNotifierProvider);
    if (kDebugMode) {
      print('MapNotifier build - got $appState');
    }
    if (appState is ChoiceAppState) {
      if (kDebugMode) {
        print(
            'MapNotifier build - ChoiceAppState ${appState.start} ${appState.finish}');
      }
      return MapStatePoints(start: appState.start, finish: appState.finish);
    }
    if (appState is RouteBuilderLoaded) {
      return MapStateRoute((appState).route.map((e) => e.pos).toList());
    }
    if (appState is RouteAppState) {
      return MapStateRoute((appState).route.map((e) => e.pos).toList());
    }
    return const MapStatePoints();
  }

  void onMapTap(LatLng ll) {
    final appStateNotifier = ref.read(appStateNotifierProvider.notifier);
    appStateNotifier.onMapTap(ll);
  }

  void onPointCancel(int id) {
    final appStateNotifier = ref.read(appStateNotifierProvider.notifier);
    if (kDebugMode) {
      print('onPointCancel - MapNotifier');
    }
    appStateNotifier.onPointCancel(id);
  }
}
