import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/presentation/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/presentation/states/app_state.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/states/map_state/map_state.dart';

final mapProvider = StateNotifierProvider.autoDispose<MapController, MapState>(
  (ref) => MapController(
    appProvider: ref.watch(appProvider.notifier),
    appState: ref.watch(appProvider),
  ),
);

class MapController extends StateNotifier<MapState> {
  MapController({
    required this.appProvider,
    required this.appState,
  }) : super(
          const MapState(showRoute: false),
        );

  final AppProvider appProvider;
  final AppState appState;
}
