import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/features/project_map/presentation/project_map.dart';
import 'package:flutter_sirius_map/src/settings/presentation/controllers/locale_controller.dart';
import 'package:flutter_sirius_map/src/settings/presentation/controllers/theme_controller.dart';
import 'package:flutter_sirius_map/src/settings/presentation/widgets/setting_button.dart';
import 'package:flutter_sirius_map/utils/context.dart';

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
                final isDarkTheme = ref.watch(themeProvider) == ThemeState.dark;
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
                      context.s.search,
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
      bottomSheet: _bottomSheet,
    );
  }

  get _bottomSheet => BottomSheet(
        builder: (_) => ColoredBox(
          color: Colors.purpleAccent,
          child: SizedBox(
            height: 100.h,
            width: 100.w,
          ),
        ),
        onClosing: () {
          // ignore: avoid_print
          print('BOOBA');
        },
      );
}