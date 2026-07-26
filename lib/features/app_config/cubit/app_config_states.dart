import 'package:flutter/material.dart';

enum AppConfigStatus { initial, changing, changed }

@immutable
class AppConfigStates {
  final AppConfigStatus status;
  final ThemeMode themeMode;
  final Locale locale;

  const AppConfigStates({
    this.status = AppConfigStatus.initial,
    this.themeMode = ThemeMode.light,
    this.locale = const Locale("en"),
  });

  AppConfigStates copyWith({
    AppConfigStatus? status,
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return AppConfigStates(
      status: status ?? this.status,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
