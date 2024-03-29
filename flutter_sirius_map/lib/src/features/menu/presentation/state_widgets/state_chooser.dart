// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/app/domain/states/app_state.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/state_widgets/base_app_state_widget.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/state_widgets/choice_app_state_widget.dart';
import 'package:flutter_sirius_map/src/features/menu/presentation/state_widgets/route_app_state_wdget.dart';

class StateChooser extends ConsumerWidget {
  const StateChooser({super.key});

  @override
  Widget build(context, ref) {
    final appState = ref.watch(appStateNotifierProvider);

    return switch (appState) {
      InitAppState() => const CircularProgressIndicator(),
      BaseAppState() => BaseAppStateWidget(),
      ChoiceAppState() => ChoiceAppStateWidget(),
      RouteBuilderLoading() => const CircularProgressIndicator(),
      RouteBuilderError() => Text(appState.error.toString()),
      RouteAppState() => RouteAppStateWidget(),
    };
  }
}
