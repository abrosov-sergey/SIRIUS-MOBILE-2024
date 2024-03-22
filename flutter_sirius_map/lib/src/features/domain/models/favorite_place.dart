import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_place.freezed.dart';

@freezed
class FavoritePlace with _$FavoritePlace {
  const factory FavoritePlace({
    required int id,
    required String name,
  }) = _FavoritePlace;
}