import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/src/config/themes/colors/app_colors.dart';
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
  static List<Color> primaryColor = [
    AppColors.primaryColorLight,
    AppColors.primaryColorDark,
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
  static List<Color> shadowColor = [
    Colors.grey.withOpacity(0.3),
    Colors.black.withOpacity(0.3)
  ];

  static List<Color> searchFieldColor = [
    getColorFromHex('#E9E9E9'),
    getColorFromHex('#4A4A4A')
  ];
  
  static List<Color> searchFieldFillerColor = [
    getColorFromHex("#6C6C6C"),
    getColorFromHex("#F1F1F1")
  ];

}

Color getColorFromHex(String hexColor) {
  var hex = hexColor.replaceAll('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex';
  }
  return Color(int.parse(hex, radix: 16));
}