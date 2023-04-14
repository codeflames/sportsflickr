import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/local_storage/app_storage.dart';

import 'dark_theme.dart';
import 'light_theme.dart';
import 'theme_service.dart';

export 'custom_theme_data.dart';
export 'styles.dart';
export 'fontStyles.dart';
export 'colors.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
// export 'package:octaden/gen/assets.gen.dart';

final themeProvider = Provider<AppTheme>((ref) => AppTheme(ref));
final themeModeProvider = StateProvider.autoDispose<ThemeMode>((ref) {
  //check hive storage if there's any saved theme mode
  //if not, return system
  final theme = ref.read(hiveStorageProvider).get<String?>('themeMode');
  log("value of theme is $theme");
  if (theme == null) {
    log("theme is null");
    ref.read(hiveStorageProvider).put<String?>('themeMode', 'system');
    return ThemeMode.system;
  } else if (theme == 'light') {
    log("theme is light");
    return ThemeMode.light;
  } else if (theme == 'dark') {
    log("theme is dark");
    return ThemeMode.dark;
  } else {
    log("theme is system");
    return ThemeMode.system;
  }
});

class AppTheme extends ThemeService {
  AppTheme(super.read);

  ThemeData get lightTheme => LightTheme.lightTheme;
  ThemeData get darkTheme => DarkTheme.darkTheme;
}
