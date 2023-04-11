import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
final themeModeProvider =
    StateProvider.autoDispose<ThemeMode>((ref) => ThemeMode.light);

class AppTheme extends ThemeService {
  AppTheme(super.read);

  ThemeData get lightTheme => LightTheme.lightTheme;
  ThemeData get darkTheme => DarkTheme.darkTheme;
}
