import 'package:flutter_sirius_map/src/features/favorite_place/domain/models/favorite_place.dart';

abstract class FavoritePlacesRepository {
  List<FavoritePlaceInstance> getAllPlaces();

  Future<void> addPlace(FavoritePlaceInstance place);

  Future<void> deletePlace(int id);
}
