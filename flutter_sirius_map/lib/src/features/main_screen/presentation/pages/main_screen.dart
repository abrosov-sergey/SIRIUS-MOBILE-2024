import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/core/navigation/app_routes.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/bottom_sheet.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/project_map.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/providers/locale_provider.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/providers/theme_provider.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/widgets/setting_button.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          const ProjectMap(),
          SafeArea(
            child: Consumer(
              builder: (_, ref, __) {
                final isDarkTheme = ref.watch(themeProvider).isDarkTheme;
                return Column(
                  children: [
                    SettingButton.icon(
                      iconData:
                          isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                      onTap: () {
                        ref.read(themeProvider.notifier).changeTheme();
                      },
                    ),
                    SettingButton.text(
                      text: context.localization.language,
                      onTap: () {
                        ref.read(localeProvider.notifier).changeLocale();
                      },
                    ),
                    SettingButton.icon(
                        iconData: Icons.qr_code,
                        onTap: () =>
                            Navigator.of(context).pushNamed(AppRoutes.qrRoot))
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: const MenuBottomSheet(),
    );
  }
}
