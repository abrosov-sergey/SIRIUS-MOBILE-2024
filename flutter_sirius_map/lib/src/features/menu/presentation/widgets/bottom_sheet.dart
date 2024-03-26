import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/providers/scroll_controller_providrr.dart';
import 'package:flutter_sirius_map/src/features/search_field/presentation/search_field.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/build_route_button.dart';
import 'package:flutter_sirius_map/src/utils/context.dart';
import 'package:flutter_sirius_map/src/utils/sliver_utils.dart';

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
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
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
                    height: 15.h,
                  ).sliver,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [BuildRouteButton()],
                    ),
                  ).sliver,
                ],
                controller: scrollController,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 5.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: context.themeExtendColors.iconBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,),
                  Row(
                    children: [
                      SerchField(),
                      BuildRouteButton()
                    ],
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
