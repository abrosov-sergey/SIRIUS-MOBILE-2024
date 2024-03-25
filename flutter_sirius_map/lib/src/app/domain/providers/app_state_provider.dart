import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';

final appProvider = StateNotifierProvider.autoDispose<AppProvider, AppState>(
  (ref) => AppProvider(),
);

class AppProvider extends StateNotifier<AppState> {
  AppProvider() : super(const BaseAppState());

  void changeAppGlobalState(AppState appState) {
    state = appState;
  }
  // TODO: обработка состояний
}
