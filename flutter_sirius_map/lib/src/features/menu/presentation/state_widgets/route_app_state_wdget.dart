import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/bottom_bar_button.dart';

class RouteAppStateWidget extends ConsumerWidget {
  const RouteAppStateWidget({super.key});

  @override
  Widget build(context, ref) {
    final notifier = ref.watch(appStateNotifierProvider.notifier);

    return Column(
      children: [
        SizedBox(height: 24.h),
        BottomBarButton(
          callBack: notifier.setBaseState,
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            child: Text(
              context.localization.endRoute,
              style: context.themeExtendTextStyles.bodyStyle
                  .copyWith(color: context.themeExtendColors.iconColor),
            ),
          ),
        )
      ],
    );
  }
}
