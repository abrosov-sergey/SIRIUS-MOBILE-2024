import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/config/themes/colors/app_colors.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors_theme.tailor.dart';

@Tailor(
  themes: ['light', 'dark'],
  themeGetter: ThemeGetter.none,
  generateStaticGetters: true,
)
class $_AppColorsTheme {
  static List<Color> iconColor = [
    AppColors.iconColorLight,
    AppColors.iconColorDark,
  ];
  static List<Color> backgroundColor = [
    AppColors.backgroundLight,
    AppColors.backgroundDark,
  ];

  static List<Color> secondaryColor = [
    AppColors.secondaryColorLight,
    AppColors.secondaryColorDark,
  ];

  static List<Color> iconBackgroundColor = [
    AppColors.iconBackgroundColorLight,
    AppColors.iconBackgroundColorDark,
  ];

  static List<Color> accentColor = [
    AppColors.accentColorLight,
    AppColors.accentColorDark,
  ];
}
