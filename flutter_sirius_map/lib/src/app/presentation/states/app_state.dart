import 'package:flutter/material.dart';
import 'package:flutter_sirius_map/src/app/presentation/states/app_global_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

enum ThemeState { light, dark }

@freezed
class AppState with _$AppState {
  const factory AppState({
    required Locale locale,
    required ThemeState theme,
    required AppGlobalState state,
  }) = _AppState;
}
