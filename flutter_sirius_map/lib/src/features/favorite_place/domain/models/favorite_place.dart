import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_place.freezed.dart';
part 'favorite_place.g.dart';

@freezed
class FavoritePlaceInstance with _$FavoritePlaceInstance {
  const factory FavoritePlaceInstance({
    required String name,
    required int placeId,
  }) = _FavoritePlaceInstance;

  factory FavoritePlaceInstance.fromJson(Map<String, Object?> json) =>
      _$FavoritePlaceInstanceFromJson(json);
}
