import 'package:flutter_sirius_map/src/app/domain/place_point.dart';

sealed class AppState {
  const AppState();
}

class BaseAppState extends AppState {
  const BaseAppState();
}

// выбрать первую точку
class ChoiceAppState extends AppState {
  final PlacePoint? start;
  final PlacePoint? finish;
  const ChoiceAppState({
    this.start,
    this.finish,
  });

  ChoiceAppState copyWith({
    PlacePoint? start,
    PlacePoint? finish,
  }) =>
      ChoiceAppState(
        start: start ?? this.start,
        finish: finish ?? this.finish,
      );
}

sealed class RouteBuilderAppState extends AppState {
  const RouteBuilderAppState();
}

class RouteBuilderLoading extends RouteBuilderAppState {}

class RouteBuilderError extends RouteBuilderAppState {
  final String? error;
  final StackTrace? stackTrace;
  const RouteBuilderError({this.error, this.stackTrace});
}

class RouteBuilderLoaded extends RouteBuilderAppState {
  final List<PlacePoint> route;
  const RouteBuilderLoaded({required this.route});
}

class RouteAppState extends AppState {
  final List<PlacePoint> route;
  const RouteAppState({required this.route});
}