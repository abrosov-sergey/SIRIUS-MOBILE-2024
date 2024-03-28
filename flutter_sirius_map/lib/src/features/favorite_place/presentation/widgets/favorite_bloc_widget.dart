import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/core/widgets/animated_text.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/domain/models/favorite_place.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/presentation/providers/favorite_places_provider.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/presentation/widgets/favorite_item.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:flutter_sirius_map/src/core/utils/sliver_utils.dart';

class FavoriteBlocWidget extends ConsumerWidget {
  final void Function(int) onFavoriteChoice;
  const FavoriteBlocWidget({
    required this.onFavoriteChoice,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favPlacesState = ref.watch(favoritePlacesProvider);
    final favPlaces = favPlacesState.favoritePlaces;
    final isEditMode = favPlacesState.isEditMode;

    String buttonText =
        isEditMode ? context.localization.cancel : context.localization.edit;

    final String favText = context.localization.favorites;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedTextWrapper(
                text: Text(
                  favText,
                  key: ValueKey(favText.hashCode),
                  style: context.themeExtendTextStyles.headerStyle,
                ),
              ),
              if (favPlaces.isNotEmpty)
                InkWell(
                  onTap: () {
                    ref.read(favoritePlacesProvider.notifier).toggleEditMode();
                  },
                  child: AnimatedTextWrapper(
                    text: Text(
                      key: ValueKey(buttonText.hashCode),
                      buttonText,
                      style: context.themeExtendTextStyles.headerStyle
                          .copyWith(color: context.themeExtendColors.iconColor),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.themeExtendColors.secondaryColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                FavoriteItem(
                  showDeleteButton: false,
                  text: context.localization.add,
                  iconData: Icons.add,
                  onTap: () => _tapAdd(ref),
                ).sliver,
                SliverList.builder(
                  itemCount: favPlaces.length,
                  itemBuilder: (context, index) => FavoriteItem(
                    key: ValueKey(favPlaces[index].placeId.hashCode),
                    placeId: favPlaces[index].placeId,
                    text: favPlaces[index].name,
                    iconData: Icons.location_on,
                    showDeleteButton: isEditMode,
                    onTap: () => onFavoriteChoice(index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _tapAdd(WidgetRef ref) async {
  ref.read(favoritePlacesProvider.notifier).addNewPlace(
        FavoritePlaceInstance(
          placeId: Random().nextInt(10959083),
          name: "AAAAAAAAA",
        ),
      );
  // TODO: Обработать клик на добавление нового любимого места
}
