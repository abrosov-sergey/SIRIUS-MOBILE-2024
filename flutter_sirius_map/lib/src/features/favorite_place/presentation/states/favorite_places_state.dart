import 'package:flutter_sirius_map/src/features/favorite_place/domain/models/favorite_place.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_places_state.freezed.dart';

@freezed
class FavoritePlacesState with _$FavoritePlacesState {
  const factory FavoritePlacesState({
    @Default([]) List<FavoritePlaceInstance> favoritePlaces,
    @Default(false) bool isEditMode,
  }) = _FavoritePlacesState;
}
