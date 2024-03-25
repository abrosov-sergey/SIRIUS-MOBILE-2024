import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/config/localization/app_localization.dart';

final localeProvider =
    StateNotifierProvider.autoDispose<LocaleProvider, Locale>(
  (ref) => LocaleProvider(),
);

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider() : super(AppLocalization.ru);

  void changeLocale() {
    if (AppLocalization.isEn(state)) {
      state = AppLocalization.ru;
    } else {
      state = AppLocalization.en;
    }
  }
}
