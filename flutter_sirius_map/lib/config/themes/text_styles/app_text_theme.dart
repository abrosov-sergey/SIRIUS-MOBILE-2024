import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/config/themes/colors/app_colors.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_text_theme.tailor.dart';

@Tailor(
  themes: ['light', 'dark'],
  themeGetter: ThemeGetter.none,
  generateStaticGetters: true,
)
class $_AppTextTheme {
  static const w400S12H14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 14 / 12,
  );

  static List<TextStyle> w400S12H14Example = [
    w400S12H14.apply(color: AppColors.iconColorDark),
    w400S12H14.apply(color: AppColors.iconColorDark),
  ];
}
