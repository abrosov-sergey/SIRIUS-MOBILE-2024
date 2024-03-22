import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/config/themes/colors/app_colors_theme.dart';
import 'package:flutter_sirius_map/config/themes/text_styles/app_text_theme.dart';

extension ContextUtils on BuildContext {
  // S get s => S.of(this);

  AppColorsTheme get themeExtendColors =>
      Theme.of(this).extension<AppColorsTheme>()!;

  AppTextTheme get themeExtendTextStyles =>
      Theme.of(this).extension<AppTextTheme>()!;
}
