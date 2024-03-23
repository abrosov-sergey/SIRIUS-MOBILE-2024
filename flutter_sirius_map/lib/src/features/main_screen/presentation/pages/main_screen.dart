import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/app/presentation/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/presentation/states/app_state.dart';
import 'package:flutter_sirius_map/src/features/map/presentation/widgets/project_map.dart';
import 'package:flutter_sirius_map/src/features/main_screen/presentation/widgets/setting_button.dart';
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
                final isDarkTheme =
                    ref.watch(appProvider).theme == ThemeState.dark;
                return Column(
                  children: [
                    SettingButton(
                      iconData:
                          isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                      onTap: () {
                        ref.read(appProvider.notifier).changeTheme();
                      },
                    ),
                    SettingButton(
                      iconData: Icons.egg_rounded,
                      onTap: () {
                        ref.read(appProvider.notifier).changeLocale();
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
