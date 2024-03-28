import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/bottom_bar_button.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/swap_icon.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/textfield_with_cancel.dart';

class ChoiceAppStateWidget extends ConsumerWidget {
  const ChoiceAppStateWidget({super.key});

  String? _getPointText(PlacePoint? placePoint) {
    if (placePoint == null) return null;
    return placePoint.name;
  }

  @override
  Widget build(context, ref) {
    final notifier = ref.watch(appStateNotifierProvider.notifier);
    final appState = ref.watch(appStateNotifierProvider) as ChoiceAppState;

    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 16.w),
            BackButton(
              color: context.themeExtendColors.iconColor,
              onPressed: notifier.setBaseState,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.h),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextfieldWithCancel(
                      onCancel: notifier.onStartPointCancel,
                      onChoose: (id) => notifier.onStartPointChoice(id),
                      initText: _getPointText(appState.start),
                    ),
                    SizedBox(height: 32.w),
                    TextfieldWithCancel(
                      onCancel: notifier.onFinishPointCancel,
                      onChoose: (id) => notifier.onFinishPointChoice(id),
                      initText: _getPointText(appState.finish),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 32.w),
              BottomBarButton(
                callBack: notifier.onPlacePointsSwap,
                icon: const SwapIcon(),
              )
            ],
          ),
        ),
        SizedBox(height: 40.h),
        BottomBarButton(
          callBack: notifier.onRouteBuild,
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            child: Text(
              context.localization.buildRoute,
              style: context.themeExtendTextStyles.bodyStyle
                  .copyWith(color: context.themeExtendColors.iconColor),
            ),
          ),
        )
      ],
    );
  }
}
