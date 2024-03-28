import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/src/config/localization/app_localization.dart';
import 'package:flutter_sirius_map/src/config/themes/colors/app_colors_theme.dart';
import 'package:flutter_sirius_map/src/config/themes/text_styles/app_text_theme.dart';

extension ContextUtils on BuildContext {
  AppColorsTheme get themeExtendColors =>
      Theme.of(this).extension<AppColorsTheme>()!;

  AppTextTheme get themeExtendTextStyles =>
      Theme.of(this).extension<AppTextTheme>()!;

  AppLocalizations get localization => AppLocalization.of(this);
}
