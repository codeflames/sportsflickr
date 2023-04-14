import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/local_storage/app_storage.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

class ThemeService {
  final Ref _ref;
  ThemeService(this._ref);

  bool get isDarkMode => _isDarkMode();

  //Get Current theme status with Provider
  bool _isDarkMode() {
    final mode = _ref.read(themeModeProvider);
    log('mode: $mode');
    switch (mode) {
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:

      default:
        return false;
    }
  }

  //Get Current theme status with contetext
  isDarkModeContext(BuildContext context) {
    switch (Theme.of(context).brightness) {
      case Brightness.dark:
        return true;
      default:
        return false;
    }
  }

  setLightTheme() {
    _ref.read(themeModeProvider.notifier).update((state) => ThemeMode.light);
    _ref.read(hiveStorageProvider).put<String?>('themeMode', 'light');
  }

  setDarkTheme() {
    _ref.read(themeModeProvider.notifier).update((state) => ThemeMode.dark);
    _ref.read(hiveStorageProvider).put<String?>('themeMode', 'dark');
  }

  // Set theme mode to system
  void setSystemTheme() {
    _ref.read(themeModeProvider.notifier).update((state) => ThemeMode.system);
    _ref.read(hiveStorageProvider).put<String?>('themeMode', 'system');
  }
}
