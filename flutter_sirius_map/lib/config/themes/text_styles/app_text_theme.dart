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
  static const _headerStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  static const _bodyStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );

  static List<TextStyle> headerStyle = [
    _headerStyle.apply(color: AppColors.headerTextColorLight),
    _headerStyle.apply(color: AppColors.headerTextColorDark),
  ];
  static List<TextStyle> bodyStyle = [
    _bodyStyle.apply(color: AppColors.bodyTextColorLight),
    _bodyStyle.apply(color: AppColors.bodyTextColorDark),
  ];
}
