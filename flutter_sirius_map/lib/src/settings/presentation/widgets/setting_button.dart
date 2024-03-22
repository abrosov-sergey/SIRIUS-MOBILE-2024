import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/utils/context.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key, required this.iconData, required this.onTap});
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: context.themeExtendColors.iconBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            size: 24,
            color: context.themeExtendColors.iconColor,
          ),
        ),
      ),
    );
  }
}
