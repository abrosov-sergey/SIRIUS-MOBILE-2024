import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    required bool showRoute,
  }) = _MapState;
}
