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
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.primaryColor,
    required this.searchFieldColor,
    required this.searchFieldFillerColor,
    required this.secondaryColor,
    required this.shadowColor,
  });

  final Color accentColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color primaryColor;
  final Color searchFieldColor;
  final Color searchFieldFillerColor;
  final Color secondaryColor;
  final Color shadowColor;

  static AppColorsTheme get light => kDebugMode ? _lightGetter : _lightFinal;

  static AppColorsTheme get dark => kDebugMode ? _darkGetter : _darkFinal;

  static AppColorsTheme get _lightGetter => AppColorsTheme(
        accentColor: $_AppColorsTheme.accentColor[0],
        iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[0],
        iconColor: $_AppColorsTheme.iconColor[0],
        primaryColor: $_AppColorsTheme.primaryColor[0],
        searchFieldColor: $_AppColorsTheme.searchFieldColor[0],
        searchFieldFillerColor: $_AppColorsTheme.searchFieldFillerColor[0],
        secondaryColor: $_AppColorsTheme.secondaryColor[0],
        shadowColor: $_AppColorsTheme.shadowColor[0],
      );

  static final AppColorsTheme _lightFinal = AppColorsTheme(
    accentColor: $_AppColorsTheme.accentColor[0],
    iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[0],
    iconColor: $_AppColorsTheme.iconColor[0],
    primaryColor: $_AppColorsTheme.primaryColor[0],
    searchFieldColor: $_AppColorsTheme.searchFieldColor[0],
    searchFieldFillerColor: $_AppColorsTheme.searchFieldFillerColor[0],
    secondaryColor: $_AppColorsTheme.secondaryColor[0],
    shadowColor: $_AppColorsTheme.shadowColor[0],
  );

  static AppColorsTheme get _darkGetter => AppColorsTheme(
        accentColor: $_AppColorsTheme.accentColor[1],
        iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[1],
        iconColor: $_AppColorsTheme.iconColor[1],
        primaryColor: $_AppColorsTheme.primaryColor[1],
        searchFieldColor: $_AppColorsTheme.searchFieldColor[1],
        searchFieldFillerColor: $_AppColorsTheme.searchFieldFillerColor[1],
        secondaryColor: $_AppColorsTheme.secondaryColor[1],
        shadowColor: $_AppColorsTheme.shadowColor[1],
      );

  static final AppColorsTheme _darkFinal = AppColorsTheme(
    accentColor: $_AppColorsTheme.accentColor[1],
    iconBackgroundColor: $_AppColorsTheme.iconBackgroundColor[1],
    iconColor: $_AppColorsTheme.iconColor[1],
    primaryColor: $_AppColorsTheme.primaryColor[1],
    searchFieldColor: $_AppColorsTheme.searchFieldColor[1],
    searchFieldFillerColor: $_AppColorsTheme.searchFieldFillerColor[1],
    secondaryColor: $_AppColorsTheme.secondaryColor[1],
    shadowColor: $_AppColorsTheme.shadowColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppColorsTheme copyWith({
    Color? accentColor,
    Color? iconBackgroundColor,
    Color? iconColor,
    Color? primaryColor,
    Color? searchFieldColor,
    Color? searchFieldFillerColor,
    Color? secondaryColor,
    Color? shadowColor,
  }) {
    return AppColorsTheme(
      accentColor: accentColor ?? this.accentColor,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      iconColor: iconColor ?? this.iconColor,
      primaryColor: primaryColor ?? this.primaryColor,
      searchFieldColor: searchFieldColor ?? this.searchFieldColor,
      searchFieldFillerColor:
          searchFieldFillerColor ?? this.searchFieldFillerColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) {
    if (other is! AppColorsTheme) return this;
    return AppColorsTheme(
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      iconBackgroundColor:
          Color.lerp(iconBackgroundColor, other.iconBackgroundColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      searchFieldColor:
          Color.lerp(searchFieldColor, other.searchFieldColor, t)!,
      searchFieldFillerColor:
          Color.lerp(searchFieldFillerColor, other.searchFieldFillerColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppColorsTheme'))
      ..add(DiagnosticsProperty('accentColor', accentColor))
      ..add(DiagnosticsProperty('iconBackgroundColor', iconBackgroundColor))
      ..add(DiagnosticsProperty('iconColor', iconColor))
      ..add(DiagnosticsProperty('primaryColor', primaryColor))
      ..add(DiagnosticsProperty('searchFieldColor', searchFieldColor))
      ..add(
          DiagnosticsProperty('searchFieldFillerColor', searchFieldFillerColor))
      ..add(DiagnosticsProperty('secondaryColor', secondaryColor))
      ..add(DiagnosticsProperty('shadowColor', shadowColor));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColorsTheme &&
            const DeepCollectionEquality()
                .equals(accentColor, other.accentColor) &&
            const DeepCollectionEquality()
                .equals(iconBackgroundColor, other.iconBackgroundColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(primaryColor, other.primaryColor) &&
            const DeepCollectionEquality()
                .equals(searchFieldColor, other.searchFieldColor) &&
            const DeepCollectionEquality()
                .equals(searchFieldFillerColor, other.searchFieldFillerColor) &&
            const DeepCollectionEquality()
                .equals(secondaryColor, other.secondaryColor) &&
            const DeepCollectionEquality()
                .equals(shadowColor, other.shadowColor));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(accentColor),
        const DeepCollectionEquality().hash(iconBackgroundColor),
        const DeepCollectionEquality().hash(iconColor),
        const DeepCollectionEquality().hash(primaryColor),
        const DeepCollectionEquality().hash(searchFieldColor),
        const DeepCollectionEquality().hash(searchFieldFillerColor),
        const DeepCollectionEquality().hash(secondaryColor),
        const DeepCollectionEquality().hash(shadowColor));
  }
}
