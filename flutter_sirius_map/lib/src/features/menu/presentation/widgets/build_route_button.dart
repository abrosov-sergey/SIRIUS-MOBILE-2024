import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/bottom_bar_button.dart';

class BuildRouteButton extends StatelessWidget {
  final void Function() callBack;
  const BuildRouteButton({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return BottomBarButton(
      callBack: callBack,
      icon: Icon(
        Icons.route,
        color: context.themeExtendColors.iconColor,
      ),
    );
  }
}
