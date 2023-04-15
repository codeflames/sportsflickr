import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/features/buddies/view/buddies_view.dart';
import 'package:sportsflickr/app/features/discover/view/discover_view.dart';
import 'package:sportsflickr/app/features/login/view/login_view.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/register/view/select_sport_interests.dart';
import 'package:sportsflickr/app/features/register/view/phone_code_sent.dart';
import 'package:sportsflickr/app/features/register/view/register_view.dart';
import 'package:sportsflickr/app/features/settings/view/about_view.dart';
import 'package:sportsflickr/app/features/settings/view/change_password_view.dart';
import 'package:sportsflickr/app/features/settings/view/contact_us_view.dart';
import 'package:sportsflickr/app/features/settings/view/privacy_policy_view.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';
import 'package:sportsflickr/app/features/settings/view/terms_of_service_view.dart';
import 'package:sportsflickr/app/features/settings/view/theme_settings_view.dart';
import 'package:sportsflickr/app/features/settings/view/update_email_view.dart';
import 'package:sportsflickr/app/features/settings/view/update_username_view.dart';

import '../../features/main/view/main_view.dart';

GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

///
/// for getting routers that are present in the app
///
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: RegisterView.routeName,
      navigatorKey: _navigatorKey,
      debugLogDiagnostics: true,
      // redirect: (context, state) {},
      routes: [
        GoRoute(
            path: RegisterView.routeName,
            name: RegisterView.routeName,
            builder: (context, state) => RegisterView()),
        GoRoute(
            path: SelectSportsInterestPage.routeName,
            name: SelectSportsInterestPage.routeName,
            builder: (context, state) => const SelectSportsInterestPage()),
        GoRoute(
            path: PhoneCodeSentSentPage.routeName,
            name: PhoneCodeSentSentPage.routeName,
            builder: (context, state) => PhoneCodeSentSentPage()),
        GoRoute(
            path: LoginView.routeName,
            name: LoginView.routeName,
            builder: (context, state) => LoginView()),
        ShellRoute(
          builder: (context, state, child) => MainView(child: child),
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileView.routeName,
              name: ProfileView.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfileView()),
            ),
            GoRoute(
                path: BuddiesView.routeName,
                name: BuddiesView.routeName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BuddiesView())),
            GoRoute(
                path: DiscoverView.routeName,
                name: DiscoverView.routeName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: DiscoverView())),
            GoRoute(
                path: SettingsView.routeName,
                name: SettingsView.routeName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsView())),
          ],
        ),
        GoRoute(
            path: ChangePasswordView.routeName,
            name: ChangePasswordView.routeName,
            builder: (context, state) => const ChangePasswordView()),
        GoRoute(
            path: UpdateEmailView.routeName,
            name: UpdateEmailView.routeName,
            builder: (context, state) => UpdateEmailView()),
        GoRoute(
            path: UpdateUsernameView.routeName,
            name: UpdateUsernameView.routeName,
            builder: (context, state) => UpdateUsernameView()),
        GoRoute(
            path: AboutView.routeName,
            name: AboutView.routeName,
            builder: (context, state) => const AboutView()),
        GoRoute(
            path: TermsOfServiceView.routeName,
            name: TermsOfServiceView.routeName,
            builder: (context, state) => const TermsOfServiceView()),
        GoRoute(
            path: PrivacyPolicyView.routeName,
            name: PrivacyPolicyView.routeName,
            builder: (context, state) => const PrivacyPolicyView()),
        GoRoute(
            path: ContactUsView.routeName,
            name: ContactUsView.routeName,
            builder: (context, state) => const ContactUsView()),
        GoRoute(
            path: ThemeSettingsView.routeName,
            name: ThemeSettingsView.routeName,
            builder: (context, state) => const ThemeSettingsView()),
      ],
    );
  },
);
