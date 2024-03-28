import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';

// Add this CustomPaint widget to the Widget Tree
class SwapIcon extends StatelessWidget {
  const SwapIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(30.w, 60.h),
      painter: Painter(color: context.themeExtendColors.iconColor),
    );
  }
}

class Painter extends CustomPainter {
  final Color color;
  Painter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    var path0 = Path();
    path0.moveTo(
      0.16666667 * w,
      0.33333334 * h,
    );
    path0.lineTo(
      0.29166666 * w,
      0.20833333 * h,
    );
    path0.lineTo(
      0.41666666 * w,
      0.33333334 * h,
    );
    Paint paint0 = Paint();
    paint0.color = color;
    paint0.style = PaintingStyle.stroke;
    paint0.strokeWidth = 2;
    canvas.drawPath(path0, paint0);

    var path1 = Path();
    path1.moveTo(
      0.29166666 * w,
      0.8333333 * h,
    );
    path1.lineTo(
      0.29166666 * w,
      0.25 * h,
    );
    Paint paint1 = Paint();
    paint1.color = color;
    paint1.style = PaintingStyle.stroke;
    paint1.strokeWidth = 2;
    canvas.drawPath(path1, paint1);

    var path2 = Path();
    path2.moveTo(
      0.8333333 * w,
      0.7083333 * h,
    );
    path2.lineTo(
      0.7083333 * w,
      0.8333333 * h,
    );
    path2.lineTo(
      0.5833333 * w,
      0.7083333 * h,
    );
    Paint paint2 = Paint();
    paint2.color = color;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 2;
    canvas.drawPath(path2, paint2);

    var path3 = Path();
    path3.moveTo(
      0.7083333 * w,
      0.20833333 * h,
    );
    path3.lineTo(
      0.7083333 * w,
      0.7916667 * h,
    );
    Paint paint3 = Paint();
    paint3.color = color;
    paint3.style = PaintingStyle.stroke;
    paint3.strokeWidth = 2;
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return false;
  }
}
