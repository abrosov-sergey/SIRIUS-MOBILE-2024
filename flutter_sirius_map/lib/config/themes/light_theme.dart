import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/config/themes/colors/app_colors_theme.dart';
import 'package:flutter_sirius_map/config/themes/text_styles/app_text_theme.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  extensions: <ThemeExtension<dynamic>>[
    AppTextTheme.light,
    AppColorsTheme.light,
  ],
);
