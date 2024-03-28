import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/local_storage/domain/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themeKey = "isDarkTheme";

enum ThemeState {
  light,
  dark;

  bool get isDarkTheme => this == ThemeState.dark;
}

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeProvider, ThemeState>(
  (ref) => ThemeProvider(ref.read(sharedPreferencesProvider)),
);

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider(this._storage) : super(_theme(_storage));
  final SharedPreferences _storage;

  Future<void> changeTheme() async {
    if (state.isDarkTheme) {
      state = ThemeState.light;
    } else {
      state = ThemeState.dark;
    }

    await _storage.setBool(_themeKey, state.isDarkTheme);
  }

  static _theme(SharedPreferences storage) {
    bool? isDarkTheme = storage.getBool(_themeKey);
    if (isDarkTheme == null || !isDarkTheme) {
      return ThemeState.light;
    }
    return ThemeState.dark;
  }
}
