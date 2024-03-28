import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/providers/scroll_controller_providrr.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/core/utils/sliver_utils.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/state_chooser.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) => ProviderScope(
        overrides: [
          scrollControllerProvider.overrideWith((ref) => scrollController)
        ],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: context.themeExtendColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: context.themeExtendColors.shadowColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomScrollView(
                slivers: [
                  SizedBox(
                    height: 20.h,
                  ).sliver,
                  const StateChooser().sliver,
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [BuildRouteButton()],
                  //   ),
                  // ).sliver,
                  // const FavoriteBlocWidget().sliver,
                ],
                controller: scrollController,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 5.h,
                    width: 35.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.themeExtendColors.iconBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 0.9,
      shouldCloseOnMinExtent: false,
      expand: false,
      snap: true,
      snapSizes: const [
        0.15,
        0.4,
        0.9,
      ],
    );
  }
}
