import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/utils/context.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
    this.iconData,
    required this.onTap,
    this.text,
  });
  final IconData? iconData;
  final VoidCallback onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    Widget body = const SizedBox();
    if (iconData != null) {
      body = Icon(
        iconData,
        size: 25.w,
        color: context.themeExtendColors.iconColor,
      );
    } else if (text != null) {
      body = Text(
        text!,
        style: TextStyle(
          color: context.themeExtendColors.iconColor,
          fontSize: 16.w,
        ),
      );
    }
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: context.themeExtendColors.iconBackgroundColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: body,
          ),
        ),
      ),
    );
  }
}
