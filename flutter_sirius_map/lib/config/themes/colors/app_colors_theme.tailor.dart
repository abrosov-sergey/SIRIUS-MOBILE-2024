// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_colors_theme.dart';

// **************************************************************************
// TailorGenerator
// **************************************************************************

class AppColorsTheme extends ThemeExtension<AppColorsTheme>
    with DiagnosticableTreeMixin {
  const AppColorsTheme({
    required this.accentColor,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.secondaryColor,
  });

  final Color accentColor;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color secondaryColor;

  static AppColorsTheme get light => kDebugMode ? _lightGetter : _lightFinal;

  static AppColorsTheme get dark => kDebugMode ? _darkGetter : _darkFinal;

  static AppColorsTheme get _lightGetter => AppColorsTheme(
        accentColor: $_AppColorsTheme.accentColor[0],
        backgroundColor: $_AppColorsTheme.backgroundColor[0],
        iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[0],
        iconColor: $_AppColorsTheme.iconColor[0],
        secondaryColor: $_AppColorsTheme.secondaryColor[0],
      );

  static final AppColorsTheme _lightFinal = AppColorsTheme(
    accentColor: $_AppColorsTheme.accentColor[0],
    backgroundColor: $_AppColorsTheme.backgroundColor[0],
    iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[0],
    iconColor: $_AppColorsTheme.iconColor[0],
    secondaryColor: $_AppColorsTheme.secondaryColor[0],
  );

  static AppColorsTheme get _darkGetter => AppColorsTheme(
        accentColor: $_AppColorsTheme.accentColor[1],
        backgroundColor: $_AppColorsTheme.backgroundColor[1],
        iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[1],
        iconColor: $_AppColorsTheme.iconColor[1],
        secondaryColor: $_AppColorsTheme.secondaryColor[1],
      );

  static final AppColorsTheme _darkFinal = AppColorsTheme(
    accentColor: $_AppColorsTheme.accentColor[1],
    backgroundColor: $_AppColorsTheme.backgroundColor[1],
    iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[1],
    iconColor: $_AppColorsTheme.iconColor[1],
    secondaryColor: $_AppColorsTheme.secondaryColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppColorsTheme copyWith({
    Color? accentColor,
    Color? backgroundColor,
    Color? iconBackgroundColor,
    Color? iconColor,
    Color? secondaryColor,
  }) {
    return AppColorsTheme(
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      iconColor: iconColor ?? this.iconColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) {
    if (other is! AppColorsTheme) return this;
    return AppColorsTheme(
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      iconBackgroundColor:
          Color.lerp(iconBackgroundColor, other.iconBackgroundColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppColorsTheme'))
      ..add(DiagnosticsProperty('accentColor', accentColor))
      ..add(DiagnosticsProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty('iconBackgroundColor', iconBackgroundColor))
      ..add(DiagnosticsProperty('iconColor', iconColor))
      ..add(DiagnosticsProperty('secondaryColor', secondaryColor));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColorsTheme &&
            const DeepCollectionEquality()
                .equals(accentColor, other.accentColor) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(iconBackgroundColor, other.iconBackgroundColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(secondaryColor, other.secondaryColor));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(accentColor),
        const DeepCollectionEquality().hash(backgroundColor),
        const DeepCollectionEquality().hash(iconBackgroundColor),
        const DeepCollectionEquality().hash(iconColor),
        const DeepCollectionEquality().hash(secondaryColor));
  }
}
