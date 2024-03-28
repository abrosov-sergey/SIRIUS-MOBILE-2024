import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sirius_map/src/config/localization/app_localization.dart';
import 'package:flutter_sirius_map/src/features/local_storage/domain/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeProvider =
    StateNotifierProvider.autoDispose<LocaleProvider, Locale>(
  (ref) => LocaleProvider(ref.read(sharedPreferencesProvider)),
);

const _localeKey = "locale";

class LocaleProvider extends StateNotifier<Locale> {
  LocaleProvider(this._storage) : super(_locale(_storage));
  final SharedPreferences _storage;

  Future<void> changeLocale() async {
    if (AppLocalization.isEn(state)) {
      state = AppLocalization.ru;
    } else {
      state = AppLocalization.en;
    }
    _storage.setString(_localeKey, state.languageCode);
  }

  static _locale(SharedPreferences storage) {
    String? storedLanguageCode = storage.getString(_localeKey);
    if (storedLanguageCode == null) {
      return AppLocalization.ru;
    }
    return Locale.fromSubtags(languageCode: storedLanguageCode);
  }
}
