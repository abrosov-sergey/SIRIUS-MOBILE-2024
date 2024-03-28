import 'package:flutter/foundation.dart';
import 'package:flutter_sirius_map/src/app/data/implementations/route_repository_imp.dart';
import 'package:flutter_sirius_map/src/app/data/repositories/route_repository.dart';
import 'package:flutter_sirius_map/src/app/domain/place_point.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@riverpod
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    _routeRepository = ref.read(routeRepositoryProvider);
    _routeRepository.init().then((_) {
      state = const BaseAppState();
    });
    return const InitAppState();
  }

  late final RouteRepository _routeRepository;

  /// событие тапа на карту
  void onMapTap(LatLng ll) {
    final placePoint = _routeRepository.getClosestPoint(ll);

    // начинаем выбор маршрута если в базовом состоянии
    if (state is BaseAppState) {
      state = ChoiceAppState(start: placePoint);
    } else if (state is ChoiceAppState) {
      final currState = state as ChoiceAppState;
      // если при выборе маршрута нет первой точки, заполняем ее
      if (currState.start == null) {
        state = currState.copyWith(start: placePoint);
      } else if (currState.finish == null) {
        // иначе если нет второй, то ее
        state = currState.copyWith(finish: placePoint);
      }
    }
  }

  void onSetChoiceAppState({int? placePointId}) {
    if (state is BaseAppState) {
      PlacePoint? placePoint = placePointId != null
          ? _routeRepository.getPointById(placePointId)
          : null;
      state = ChoiceAppState(start: placePoint);
    }
  }

  /// выбрать вторую точку
  void onFinishPointChoice(int placePointId) {
    if (state is BaseAppState) {
      state = ChoiceAppState(
        finish: _routeRepository.getPointById(placePointId),
      );
    }
    if (state is ChoiceAppState) {
      state = (state as ChoiceAppState).copyWith(
        finish: _routeRepository.getPointById(placePointId),
      );
    }
  }

  /// меняем точки местами при выборе маршрута
  void onPlacePointsSwap() {
    if (state is ChoiceAppState) {
      final currState = state as ChoiceAppState;
      state = currState.copyWith(
        start: currState.finish,
        finish: currState.start,
      );
    }
  }

  /// убрать точку
  void onPointCancel(int id) {
    if (kDebugMode) {
      print('onPointCancel - appStateProvider');
    }
    if (state is ChoiceAppState) {
      final currState = state as ChoiceAppState;
      if (currState.start != null && currState.start!.id == id) {
        onStartPointCancel();
      }
      if (currState.finish != null && currState.finish!.id == id) {
        onFinishPointCancel();
      }
    }
  }

  /// убрать точку старта
  void onStartPointCancel() {
    if (kDebugMode) {
      print('onStartPointCancel - appStateProvider');
    }
    if (state is ChoiceAppState) {
      final currState = state as ChoiceAppState;
      state = currState.withStartNull();
    }
  }

  /// убрать точку финиша
  void onFinishPointCancel() {
    if (kDebugMode) {
      print('onFinishPointCancel - appStateProvider');
    }
    if (state is ChoiceAppState) {
      final currState = state as ChoiceAppState;
      state = currState.withFinishNull();
    }
  }

  /// строим маршрут - только если есть обе точки
  void onRouteBuild() {
    if (state is ChoiceAppState) {
      final currState = state as ChoiceAppState;
      if (currState.start != null && currState.finish != null) {
        state = RouteBuilderLoading();
        try {
          final route = _routeRepository.getRoute(
            currState.start!,
            currState.finish!,
          );
          state = RouteBuilderLoaded(route: route);
        } catch (error, stackTrace) {
          state = RouteBuilderError(error: error, stackTrace: stackTrace);
        }
      }
    }
  }

  /// нажатие на кнопку 'начать маршрут'
  void onStartRoute() {
    if (state is RouteBuilderLoaded) {
      state = RouteAppState(route: (state as RouteBuilderLoaded).route);
    }
  }

  /// возврат в начальное состояние
  /// при отмене или окончании маршрута
  void setBaseState() {
    state = const BaseAppState();
  }
}
