import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/src/features/favorites/domain/models/favorite_place.dart';

class FavoriteWidget extends StatelessWidget {
  final bool isNew;
  final FavoritePlaceInstance? place;

  const FavoriteWidget({
    this.isNew = true,
    this.place,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
