import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'map_state.freezed.dart';

@freezed
sealed class MapState with _$MapState {
  const factory MapState({
    required String cachePath,
    required List<LatLng> route,
  }) = _MapState;
}
