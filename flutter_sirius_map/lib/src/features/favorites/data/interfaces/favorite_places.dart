import 'package:flutter_sirius_map/src/features/favorites/domain/models/favorite_place.dart';

abstract class FavoritePlaces {
  Future<List<FavoritePlaceInstance>> getAllPlaces();

  Future<bool> addPlace(FavoritePlaceInstance place);

  Future<bool> deletePlace(FavoritePlaceInstance place);

  Future<bool> updatePlace(FavoritePlaceInstance place);
}
