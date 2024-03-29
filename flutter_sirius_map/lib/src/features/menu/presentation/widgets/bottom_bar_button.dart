import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';

class BottomBarButton extends StatefulWidget {
  final void Function() callBack;
  final Widget icon;
  const BottomBarButton({
    super.key,
    required this.callBack,
    required this.icon,
  });

  @override
  State<BottomBarButton> createState() => _BottomBarButtonState();
}

class _BottomBarButtonState extends State<BottomBarButton> {
  double opacity = 0.3;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          opacity = 0;
        });
      },
      onTapUp: (_) {
        setState(() {
          opacity = 0.3;
        });
      },
      onTapCancel: () {
        setState(() {
          opacity = 0.3;
        });
      },
      onTap: () {
        widget.callBack();
        HapticFeedback.lightImpact();
      },
      child: AnimatedContainer(
        duration: kThemeChangeDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.themeExtendColors.secondaryColor,
          boxShadow: [
            BoxShadow(
              color: context.themeExtendColors.shadowColor.withOpacity(opacity),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.icon,
        ),
      ),
    );
  }
}
