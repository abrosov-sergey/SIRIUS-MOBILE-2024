import 'package:flutter_sirius_map/src/features/favorite_place/domain/models/favorite_place.dart';

abstract class FavoritePlacesRepository {
  Future<List<FavoritePlaceInstance>> getAllPlaces();

  Future<bool> addPlace(FavoritePlaceInstance place);

  Future<bool> deletePlace(String id);

  Future<bool> updatePlace(FavoritePlaceInstance place);
}
