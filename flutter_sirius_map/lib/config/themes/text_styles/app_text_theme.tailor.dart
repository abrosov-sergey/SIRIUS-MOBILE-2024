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
    required this.bodyStyle,
    required this.headerStyle,
  });

  final TextStyle bodyStyle;
  final TextStyle headerStyle;

  static AppTextTheme get light => kDebugMode ? _lightGetter : _lightFinal;

  static AppTextTheme get dark => kDebugMode ? _darkGetter : _darkFinal;

  static AppTextTheme get _lightGetter => AppTextTheme(
        bodyStyle: $_AppTextTheme.bodyStyle[0],
        headerStyle: $_AppTextTheme.headerStyle[0],
      );

  static final AppTextTheme _lightFinal = AppTextTheme(
    bodyStyle: $_AppTextTheme.bodyStyle[0],
    headerStyle: $_AppTextTheme.headerStyle[0],
  );

  static AppTextTheme get _darkGetter => AppTextTheme(
        bodyStyle: $_AppTextTheme.bodyStyle[1],
        headerStyle: $_AppTextTheme.headerStyle[1],
      );

  static final AppTextTheme _darkFinal = AppTextTheme(
    bodyStyle: $_AppTextTheme.bodyStyle[1],
    headerStyle: $_AppTextTheme.headerStyle[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppTextTheme copyWith({
    TextStyle? bodyStyle,
    TextStyle? headerStyle,
  }) {
    return AppTextTheme(
      bodyStyle: bodyStyle ?? this.bodyStyle,
      headerStyle: headerStyle ?? this.headerStyle,
    );
  }

  @override
  AppTextTheme lerp(ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      bodyStyle: TextStyle.lerp(bodyStyle, other.bodyStyle, t)!,
      headerStyle: TextStyle.lerp(headerStyle, other.headerStyle, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppTextTheme'))
      ..add(DiagnosticsProperty('bodyStyle', bodyStyle))
      ..add(DiagnosticsProperty('headerStyle', headerStyle));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTextTheme &&
            const DeepCollectionEquality().equals(bodyStyle, other.bodyStyle) &&
            const DeepCollectionEquality()
                .equals(headerStyle, other.headerStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(bodyStyle),
        const DeepCollectionEquality().hash(headerStyle));
  }
}
