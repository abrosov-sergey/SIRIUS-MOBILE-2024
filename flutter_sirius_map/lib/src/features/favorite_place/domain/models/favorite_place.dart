import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_place.freezed.dart';

@freezed
class FavoritePlaceInstance with _$FavoritePlaceInstance {
  const factory FavoritePlaceInstance({
    required int id,
    required String name,
  }) = _FavoritePlaceInstance;
}
