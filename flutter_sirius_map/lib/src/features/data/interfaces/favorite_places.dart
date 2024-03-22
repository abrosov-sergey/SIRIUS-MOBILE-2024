import 'package:flutter_sirius_map/src/features/domain/models/favorite_place.dart';

abstract class FavoritePlaces {
  Future<List<FavoritePlace>> getAllPlaces();

  Future<bool> addPlace(FavoritePlace place);

  Future<bool> deletePlace(FavoritePlace place);

  Future<bool> updatePlace(FavoritePlace place);
}
