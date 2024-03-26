import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';

final menuProvider = StateNotifierProvider.autoDispose<MenuProvider, bool>(
  (ref) => MenuProvider(
    appProvider: ref.watch(appStateNotifierProvider.notifier),
    appState: ref.watch(
      appStateNotifierProvider,
    ),
  ),
);

class MenuProvider extends StateNotifier<bool> {
  MenuProvider({required this.appProvider, required this.appState})
      : super(false);

  final AppStateNotifier appProvider;
  final AppState appState;
}
