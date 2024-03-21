import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/config/themes/colors/app_colors_theme.dart';
import 'package:flutter_sirius_map/config/themes/text_styles/app_text_theme.dart';

ThemeData dartTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  extensions: <ThemeExtension<dynamic>>[
    AppTextTheme.dark,
    AppColorsTheme.dark,
  ],
);
