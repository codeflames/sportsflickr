import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

import '../l10n/l10n.dart';
import 'core/router/router.dart';

class App extends ConsumerWidget {
  /// [App]
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.read(themeProvider);
    final router = ref.read(routerProvider);

    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Sports Flickr',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: appTheme.lightTheme,
            darkTheme: appTheme.darkTheme,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
          );
        });
  }
}
