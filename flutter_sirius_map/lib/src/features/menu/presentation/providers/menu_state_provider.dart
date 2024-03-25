import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/presentation/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/presentation/states/app_state.dart';

final menuProvider = StateNotifierProvider.autoDispose<MenuProvider, bool>(
  (ref) => MenuProvider(
    appProvider: ref.watch(appProvider.notifier),
    appState: ref.watch(
      appProvider,
    ),
  ),
);

class MenuProvider extends StateNotifier<bool> {
  MenuProvider({required this.appProvider, required this.appState})
      : super(false);

  final AppProvider appProvider;
  final AppState appState;
}
