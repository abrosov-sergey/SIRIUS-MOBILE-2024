import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';

class SelectedPoint extends StatelessWidget {
  final PlacePoint placePoint;
  final void Function(int) deletePoint;
  const SelectedPoint({
    super.key,
    required this.placePoint,
    required this.deletePoint,
  });

  String get text => 'id: ${placePoint.id}';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => deletePoint(placePoint.id),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: context.themeExtendColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: context.themeExtendColors.iconColor,
            width: 2.r,
          ),
        ),
        child: Text(
          text,
          style: context.themeExtendTextStyles.bodyStyle,
        ),
      ),
    );
  }
}
