import 'package:flutter_sirius_map/src/features/favorite_place/data/repositories/favorite_places_repository.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/domain/models/favorite_place.dart';

class FavoritePlacesRepositoryImpl implements FavoritePlacesRepository {
  @override
  Future<bool> addPlace(FavoritePlaceInstance place) {
    return Future(() => true);
    // TODO: implement addPlace
  }

  @override
  Future<List<FavoritePlaceInstance>> getAllPlaces() {
    return Future(() => const [
          FavoritePlaceInstance(id: '1', name: 'a', placeId: 3),
          FavoritePlaceInstance(id: '2', name: 'b', placeId: 3),
          FavoritePlaceInstance(id: '3', name: 'c', placeId: 3),
          FavoritePlaceInstance(id: '4', name: 'd', placeId: 3),
          FavoritePlaceInstance(id: '5', name: 'e', placeId: 3)
        ]);
    // TODO: implement getAllPlaces
  }

  @override
  Future<bool> updatePlace(FavoritePlaceInstance place) {
    return Future(() => true);
    // TODO: implement updatePlace
  }

  @override
  Future<bool> deletePlace(String id) {
    return Future(() => true);
    // TODO: implement deletePlace
  }
}
