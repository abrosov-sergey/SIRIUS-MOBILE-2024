import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/presentation/states/app_global_state.dart';
import 'package:flutter_sirius_map/src/app/presentation/states/app_state.dart';
import 'package:flutter_sirius_map/src/config/localization/s.dart';

final appProvider = StateNotifierProvider.autoDispose<AppProvider, AppState>(
  (ref) => AppProvider(),
);

class AppProvider extends StateNotifier<AppState> {
  AppProvider()
      : super(
          AppState(
            locale: S.en,
            theme: ThemeState.light,
            state: BaseAppState(),
          ),
        );

  void changeLocale() {
    if (S.isEn(state.locale)) {
      state = state.copyWith(locale: S.ru);
    } else {
      state = state.copyWith(locale: S.en);
    }
  }

  void changeTheme() {
    if (_isDarkTheme) {
      state = state.copyWith(theme: ThemeState.light);
    } else {
      state = state.copyWith(theme: ThemeState.dark);
    }
  }

  void changeAppGlobalState(AppGlobalState globalState) {
    state = state.copyWith(state: globalState);
  }
  // TODO: обработка состояний

  bool get _isDarkTheme => state.theme == ThemeState.dark;
}
