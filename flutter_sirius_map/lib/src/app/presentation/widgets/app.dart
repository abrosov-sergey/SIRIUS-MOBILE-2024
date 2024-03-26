import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/config/localization/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/config/themes/dark_theme.dart';
import 'package:flutter_sirius_map/src/config/themes/light_theme.dart';
import 'package:flutter_sirius_map/src/features/main_screen/presentation/pages/main_screen.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/providers/locale_provider.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/providers/theme_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider).isDarkTheme;
    final locale = ref.watch(localeProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 804),
      minTextAdapt: true,
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalization.supportedLocales,
        locale: locale,
        theme: isDarkTheme ? dartTheme : lightTheme,
        home: const MainScreen(),
      ),
    );
  }
}
