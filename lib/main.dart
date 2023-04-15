// ignore_for_file: unused_local_variable

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/firebase_options.dart';

import 'app/app.dart';
import 'app/core/local_storage/app_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance
      // Your personal reCaptcha public key goes here:
      .activate(
    androidProvider: AndroidProvider.debug,
    // appleProvider: AppleProvider.debug,
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // for initializing local storage
  final appStorage = AppStorage();
  await appStorage.initAppStorage();

  runApp(
    ProviderScope(
      overrides: [
        hiveStorageProvider.overrideWithValue(appStorage),
      ],
      child: const App(),
    ),
  );
}
