import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'map_state.freezed.dart';

@freezed
sealed class MapState with _$MapState {
  const factory MapState.pathLoaded({
    required String cachePath,
    required List<LatLng> route,
  }) = pathLoaded;
  const factory MapState.error([String? message]) = MapStateError;
  const factory MapState.loading([String? message]) = Loading;
}
