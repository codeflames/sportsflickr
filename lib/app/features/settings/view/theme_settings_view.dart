import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class ThemeSettingsView extends ConsumerWidget {
  const ThemeSettingsView({super.key});

  static const routeName = '/themeSettings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);

    void updateMode(String mode) {
      if (mode == 'system') {
        ref.read(themeProvider).setSystemTheme();
      } else if (mode == 'light') {
        ref.read(themeProvider).setLightTheme();
      } else if (mode == 'dark') {
        ref.read(themeProvider).setDarkTheme();
      } else {
        ref.read(themeProvider).setSystemTheme();
      }
    }

    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('Theme Settings', style: redHatDisplayBold16),
        onPressed: () => context.goNamed(SettingsView.routeName),
      ),
      body: Padding(
        padding: paddingH24,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 24.h,
            ),
            CupertinoFormRow(
              prefix: Text(
                'System',
                style: redHatDisplayMedium16,
              ),
              child: Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: five36BE5.withOpacity(.4),
                  thumbColor: mode == ThemeMode.system ? five36BE5 : null,
                  // trackColor: ,
                  value: mode == ThemeMode.system,
                  onChanged: (value) => updateMode('system'),
                ),
              ),
            ),
            CupertinoFormRow(
              prefix: Text(
                'Light Mode',
                style: redHatDisplayMedium16,
              ),
              child: Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: five36BE5.withOpacity(.4),
                  thumbColor: mode == ThemeMode.light ? five36BE5 : null,
                  // trackColor: ,
                  value: mode == ThemeMode.light,
                  onChanged: (value) => updateMode('light'),
                ),
              ),
            ),
            CupertinoFormRow(
              prefix: Text(
                'Dark Mode',
                style: redHatDisplayMedium16,
              ),
              child: Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: five36BE5.withOpacity(.4),
                  thumbColor: mode == ThemeMode.dark ? five36BE5 : null,
                  // trackColor: ,
                  value: mode == ThemeMode.dark,
                  onChanged: (value) => updateMode('dark'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
