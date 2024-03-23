
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/config/localization/s.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/config/themes/dark_theme.dart';
import 'package:flutter_sirius_map/config/themes/light_theme.dart';
import 'package:flutter_sirius_map/src/features/main_screen/presentation/main_screen.dart';
import 'package:flutter_sirius_map/src/settings/presentation/controllers/locale_controller.dart';
import 'package:flutter_sirius_map/src/settings/presentation/controllers/theme_controller.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider) == ThemeState.dark;

    final locale = ref.watch(localeProvider);

    return ScreenUtilInit(
      designSize: const Size(448, 998),
      minTextAdapt: true,
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.supportedLocales,
        locale: locale,
        theme: isDarkTheme ? dartTheme : lightTheme,
        home: const MainScreen(),
      ),
    );
  }
}
