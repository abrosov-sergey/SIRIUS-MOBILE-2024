import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/config/localization/s.dart';
import 'package:flutter_sirius_map/config/themes/dark_theme.dart';
import 'package:flutter_sirius_map/config/themes/light_theme.dart';
import 'package:flutter_sirius_map/src/settings/presentation/controllers/locale_controller.dart';
import 'package:flutter_sirius_map/src/settings/presentation/controllers/theme_controller.dart';
import 'package:flutter_sirius_map/src/settings/presentation/widgets/setting_button.dart';
import 'package:flutter_sirius_map/utils/context.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider) == ThemeState.dark;

    final locale = ref.watch(localeProvider);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.supportedLocales,
      locale: locale,
      theme: isDarkTheme ? dartTheme : lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeExtendColors.primaryColor,
      appBar: AppBar(
        backgroundColor: context.themeExtendColors.primaryColor,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (_, ref, __) {
            final isDarkTheme = ref.watch(themeProvider) == ThemeState.dark;
            return Column(
              children: [
                SettingButton(
                  iconData: isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                  onTap: () {
                    ref.read(themeProvider.notifier).changeTheme();
                  },
                ),
                SettingButton(
                  iconData: Icons.egg_rounded,
                  onTap: () {
                    ref.read(localeProvider.notifier).changeLocale();
                  },
                ),
                Text(
                  context.s.search,
                  style: context.themeExtendTextStyles.headerStyle
                      .copyWith(color: context.themeExtendColors.iconColor),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
