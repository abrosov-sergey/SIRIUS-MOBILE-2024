import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/config/localization/s.dart';

final localeProvider =
    StateNotifierProvider.autoDispose<LocaleProvider, Locale>(
  (ref) => LocaleProvider(),
);

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider() : super(S.ru);

  void changeLocale() {
    if (S.isEn(state)) {
      state = S.ru;
    } else {
      state = S.en;
    }
  }
}
