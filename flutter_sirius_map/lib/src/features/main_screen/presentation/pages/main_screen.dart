import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/bottom_sheet.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/project_map.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/providers/locale_provider.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/providers/theme_provider.dart';
import 'package:flutter_sirius_map/src/features/settings/presentation/widgets/setting_button.dart';
import 'package:flutter_sirius_map/src/utils/context.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ProjectMap(),
          SafeArea(
            child: Consumer(
              builder: (_, ref, __) {
                final isDarkTheme = ref.watch(themeProvider).isDarkTheme;
                return Column(
                  children: [
                    SettingButton(
                      iconData:
                          isDarkTheme ? Icons.dark_mode : Icons.light_mode,
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
                      context.localization.search,
                      style: context.themeExtendTextStyles.headerStyle
                          .copyWith(color: context.themeExtendColors.iconColor),
                    )
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
