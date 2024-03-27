import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/core/widgets/animated_text.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/presentation/providers/favorite_places_provider.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.text,
    required this.iconData,
    this.onTap,
    this.showDeleteButton = false,
    this.id = "",
  });

  final String text;
  final String id;
  final bool showDeleteButton;
  final VoidCallback? onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: showDeleteButton ? null : onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: context.themeExtendColors.iconBackgroundColor,
                    ),
                    height: 75.h,
                    width: 75.h,
                    child: Icon(
                      iconData,
                      color: context.themeExtendColors.iconColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  AnimatedTextWrapper(
                    text: Text(
                      key: ValueKey(text.hashCode),
                      text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: context.themeExtendTextStyles.bodyStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDeleteButton)
          Consumer(
            builder: (context, ref, child) => IconButton(
              onPressed: () {
                ref.read(favoritePlacesProvider.notifier).deletePlace(id);
              },
              icon: const Icon(Icons.close),
            ),
          ),
      ],
    );
  }
}
