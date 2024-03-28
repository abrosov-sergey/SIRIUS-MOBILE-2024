import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/core/widgets/animated_text.dart';

class SettingButton extends StatelessWidget {
  const SettingButton.icon({
    super.key,
    required this.iconData,
    required this.onTap,
  }) : text = null;

  const SettingButton.text({
    super.key,
    required this.text,
    required this.onTap,
  }) : iconData = null;

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
      body = AnimatedTextWrapper(
        text: Text(
          key: ValueKey(text!.hashCode),
          text!,
          style: TextStyle(
            color: context.themeExtendColors.iconColor,
            fontSize: 16.w,
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: context.themeExtendColors.shadowColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            color: context.themeExtendColors.iconBackgroundColor,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
