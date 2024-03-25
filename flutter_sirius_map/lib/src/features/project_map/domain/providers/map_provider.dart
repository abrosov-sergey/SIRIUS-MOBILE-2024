import 'package:flutter_sirius_map/src/app/presentation/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/features/project_map/domain/states/map_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  MapState build() {
    ref.watch(appProvider);
    return const MapState(route: []);
  }
}
