import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/presentation/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/presentation/states/app_state.dart';
import 'package:flutter_sirius_map/src/config/localization/s.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/config/themes/dark_theme.dart';
import 'package:flutter_sirius_map/src/config/themes/light_theme.dart';
import 'package:flutter_sirius_map/src/features/main_screen/presentation/pages/main_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);
    final isDarkTheme = appState.theme == ThemeState.dark;

    final locale = appState.locale;

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
