import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_send/core/services/shared_preferences_services.dart';
import 'package:local_send/core/utils/app_constants.dart';
import 'package:local_send/features/app_config/cubit/app_config_states.dart';

@injectable
class AppConfigCubit extends Cubit<AppConfigStates> {
  AppConfigCubit()
    : super(
        AppConfigStates(
          locale: _getCachedLocale(),
          themeMode: _getCachedTheme(),
        ),
      );

  Future<void> changeTheme(ThemeMode themeMode) async {
    if (state.themeMode == themeMode) return;

    emit(state.copyWith(status: AppConfigStatus.changing));

    await SharedPreferencesServices.saveData(
      key: AppConstants.themeKey,
      value: themeMode.name,
    );

    emit(state.copyWith(status: AppConfigStatus.changed, themeMode: themeMode));
  }

  bool get isDark => state.themeMode.isDark;

  static ThemeMode _getCachedTheme() {
    final cachedTheme = SharedPreferencesServices.getString(
      key: AppConstants.themeKey,
    );
    if (cachedTheme == 'dark') return ThemeMode.dark;
    if (cachedTheme == 'light') return ThemeMode.light;
    return ThemeMode.light;
  }

  Future<void> changeLocale(String localeCode) async {
    if (state.locale.languageCode == localeCode) return;

    emit(state.copyWith(status: AppConfigStatus.changing));

    await SharedPreferencesServices.saveData(
      key: AppConstants.localeKey,
      value: localeCode,
    );

    emit(
      state.copyWith(
        status: AppConfigStatus.changed,
        locale: Locale(localeCode),
      ),
    );
  }

  bool get isEnglish => state.locale.languageCode == 'en';

  static Locale _getCachedLocale() {
    final cachedLocale = SharedPreferencesServices.getString(
      key: AppConstants.localeKey,
    );

    return cachedLocale.isNotEmpty ? Locale(cachedLocale) : const Locale('en');
  }
}
