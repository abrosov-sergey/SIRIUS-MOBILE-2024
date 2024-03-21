import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/config/themes/colors/app_colors_theme.dart';

extension ContextUtils on BuildContext {
  // S get s => S.of(this);

  AppColorsTheme get themeExtendColors =>
      Theme.of(this).extension<AppColorsTheme>()!;
}
