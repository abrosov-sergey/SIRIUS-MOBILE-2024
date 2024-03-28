import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';

class SelectedPoint extends StatelessWidget {
  final Widget child;
  final void Function() deletePoint;
  final Color? color;
  const SelectedPoint({
    super.key,
    required this.deletePoint,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: deletePoint,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: context.themeExtendColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: color ?? context.themeExtendColors.iconColor,
            width: 2.r,
          ),
        ),
        child: child,
      ),
    );
  }
}
