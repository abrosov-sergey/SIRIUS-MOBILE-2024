// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_text_theme.dart';

// **************************************************************************
// TailorGenerator
// **************************************************************************

class AppTextTheme extends ThemeExtension<AppTextTheme>
    with DiagnosticableTreeMixin {
  const AppTextTheme({
    required this.w400S12H14Example,
  });

  final TextStyle w400S12H14Example;

  static AppTextTheme get light => kDebugMode ? _lightGetter : _lightFinal;

  static AppTextTheme get dark => kDebugMode ? _darkGetter : _darkFinal;

  static AppTextTheme get _lightGetter => AppTextTheme(
        w400S12H14Example: $_AppTextTheme.w400S12H14Example[0],
      );

  static final AppTextTheme _lightFinal = AppTextTheme(
    w400S12H14Example: $_AppTextTheme.w400S12H14Example[0],
  );

  static AppTextTheme get _darkGetter => AppTextTheme(
        w400S12H14Example: $_AppTextTheme.w400S12H14Example[1],
      );

  static final AppTextTheme _darkFinal = AppTextTheme(
    w400S12H14Example: $_AppTextTheme.w400S12H14Example[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppTextTheme copyWith({
    TextStyle? w400S12H14Example,
  }) {
    return AppTextTheme(
      w400S12H14Example: w400S12H14Example ?? this.w400S12H14Example,
    );
  }

  @override
  AppTextTheme lerp(ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      w400S12H14Example:
          TextStyle.lerp(w400S12H14Example, other.w400S12H14Example, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppTextTheme'))
      ..add(DiagnosticsProperty('w400S12H14Example', w400S12H14Example));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTextTheme &&
            const DeepCollectionEquality()
                .equals(w400S12H14Example, other.w400S12H14Example));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(w400S12H14Example));
  }
}
