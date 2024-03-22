import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeState { light, dark }

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeProvider, ThemeState>(
  (ref) => ThemeProvider(),
);

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider() : super(ThemeState.light);

  void changeTheme() {
    if (_isDarkTheme) {
      state = ThemeState.light;
    } else {
      state = ThemeState.dark;
    }
  }

  bool get _isDarkTheme => state == ThemeState.dark;
}
