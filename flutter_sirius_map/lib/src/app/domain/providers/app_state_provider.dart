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

  void updateChoiceState(PlacePoint? placePoint, {bool override = true}) {
    if (placePoint != null && state is ChoiceAppState) {
      final currState = state as ChoiceAppState;
      // если при выборе маршрута нет первой точки, заполняем первую
      if (currState.start == null) {
        state = currState.copyWith(start: placePoint);
      } else if (currState.finish == null) {
        // иначе если нет второй, ее
        state = currState.copyWith(finish: placePoint);
      } else if (override) {
        // если обе есть и хотим перезаписать, то первую
        state = currState.copyWith(start: placePoint);
      }
    }
  }

  /// событие тапа на карту
  void onMapTap(LatLng ll) {
    final placePoint = _routeRepository.getClosestPoint(ll);

    // начинаем выбор маршрута если в базовом состоянии
    if (state is BaseAppState) {
      state = BaseAppState(point: placePoint);
    } else if (state is ChoiceAppState) {
      updateChoiceState(placePoint, override: false);
    }
  }

  /// добавляем точку по ID
  void addPointById({int? placePointId}) {
    PlacePoint? placePoint = placePointId != null
        ? _routeRepository.getPointById(placePointId)
        : null;
    if (state is BaseAppState) {
      state = BaseAppState(point: placePoint);
    } else if (state is ChoiceAppState) {
      updateChoiceState(placePoint);
    }
  }

  /// переходим в ChoiceAppState
  void setChoiceAppState() {
    if (state is BaseAppState) {
      state = ChoiceAppState(start: (state as BaseAppState).point);
    }
  }

  /// выбрать первую точку
  void onStartPointChoice(int placePointId) {
    if (state is BaseAppState) {
      state = ChoiceAppState(
        start: _routeRepository.getPointById(placePointId),
      );
    } else if (state is ChoiceAppState) {
      state = (state as ChoiceAppState).copyWith(
        start: _routeRepository.getPointById(placePointId),
      );
    }
  }

  /// выбрать вторую точку
  void onFinishPointChoice(int placePointId) {
    if (state is BaseAppState) {
      state = ChoiceAppState(
        finish: _routeRepository.getPointById(placePointId),
      );
    } else if (state is ChoiceAppState) {
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
    if (state is BaseAppState) {
      state = const BaseAppState();
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
          if (route == null) {
            state = const BaseAppState();
          } else {
            state = RouteAppState(route: route);
          }
        } catch (error, stackTrace) {
          state = RouteBuilderError(error: error, stackTrace: stackTrace);
        }
      }
    }
  }

  /// возврат в начальное состояние
  /// при отмене или окончании маршрута
  void setBaseState() {
    state = const BaseAppState();
  }
}
