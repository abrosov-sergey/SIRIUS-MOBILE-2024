import 'package:flutter_sirius_map/src/app/data/implementations/route_repository_imp.dart';
import 'package:flutter_sirius_map/src/app/data/repositories/route_repository.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@riverpod
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    _routeRepository = ref.read(routeRepositoryProvider);
    _routeRepository.init().then((_) {
      state = const BaseAppState();
    });
    return const InitAppState();
  }

  late final RouteRepository _routeRepository;
}
