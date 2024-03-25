import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeState {
  light,
  dark;

  bool get isDarkTheme => this == ThemeState.dark;
}

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeProvider, ThemeState>(
  (ref) => ThemeProvider(),
);

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider() : super(ThemeState.light);

  void changeTheme() {
    if (state.isDarkTheme) {
      state = ThemeState.light;
    } else {
      state = ThemeState.dark;
    }
  }
}
