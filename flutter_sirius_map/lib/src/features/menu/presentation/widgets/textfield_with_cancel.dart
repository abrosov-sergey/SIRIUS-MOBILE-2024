import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/widgets/bottom_bar_button.dart';

class TextfieldWithCancel extends StatelessWidget {
  final String? initText;
  final void Function(int) onChoose;
  final void Function() onCancel;
  const TextfieldWithCancel({
    super.key,
    required this.onChoose,
    required this.onCancel,
    this.initText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: context.themeExtendColors.secondaryColor,
            child: Text(
              initText ?? 'future textfield',
            ), // TODO вставить тексфилд Максима
          ),
        ),
        SizedBox(width: 20.w),
        BottomBarButton(
          callBack: onCancel,
          icon: Icon(
            Icons.close,
            color: context.themeExtendColors.iconColor,
          ),
        ),
      ],
    );
  }
}
