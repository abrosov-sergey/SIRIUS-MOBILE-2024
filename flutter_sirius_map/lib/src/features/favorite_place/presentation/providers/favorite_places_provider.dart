import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/data/repositories/favorite_places_repository.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/domain/models/favorite_place.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/domain/providers/favorite_places_repository_provider.dart';
import 'package:flutter_sirius_map/src/features/favorite_place/presentation/states/favorite_places_state.dart';

final favoritePlacesProvider = StateNotifierProvider.autoDispose<
    FavoritePlacesProvider, FavoritePlacesState>(
  (ref) => FavoritePlacesProvider(
    ref.read(favoritePlacesRepositoryProvider),
  ),
);

class FavoritePlacesProvider extends StateNotifier<FavoritePlacesState> {
  FavoritePlacesProvider(this._fpRepo)
      : super(
          const FavoritePlacesState(
            favoritePlaces: [],
            isEditMode: false,
          ),
        );

  final FavoritePlacesRepository _fpRepo;

  void toggleEditMode() {
    final currentModeState = state.isEditMode;
    state = state.copyWith(isEditMode: !currentModeState);
  }

  Future<void> addNewPlace(FavoritePlaceInstance favPlace) async {
    List<FavoritePlaceInstance> currentList = state.favoritePlaces.toList();
    await _fpRepo.addPlace(favPlace);
    currentList.add(favPlace);

    state = state.copyWith(favoritePlaces: currentList);
  }

  Future<void> deletePlace(String id) async {
    List<FavoritePlaceInstance> currentList = state.favoritePlaces.toList();
    await _fpRepo.deletePlace(id);

    int temp = -1;

    for (int i = 0; i < currentList.length; i++) {
      if (currentList[i].id == id) {
        temp = i;
      }
    }

    currentList.removeAt(temp);

    if (currentList.isEmpty) {
      toggleEditMode();
    }

    state = state.copyWith(favoritePlaces: currentList);
  }

  Future<void> fetchFavPlaces() async {
    final favPlaces = await _fpRepo.getAllPlaces();
    state = state.copyWith(favoritePlaces: favPlaces);
  }
}
