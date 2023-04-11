import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class AboutView extends ConsumerWidget {
  const AboutView({super.key});

  static const routeName = '/settings/about';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('About App', style: redHatDisplayBold14),
        onPressed: () => context.goNamed(SettingsView.routeName),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: paddingH24,
            child: Column(
              children: [
                const Text(
                  '''Welcome to our sports networking app! Our app was designed to help sports enthusiasts connect with like-minded individuals in their community. Whether you're a fan of football, basketball, ice hockey, motorsports, bandy, rugby, skiing, shooting, or any other sport, our app can help you find others who share your passion.

With our app, you can easily create a profile and specify your interests during registration. You can also upload a profile picture or avatar and cover page to personalize your profile. Once registered, you can browse other users' profiles, find new friends, and even arrange to meet up for a game or workout.

We take security seriously, which is why we've implemented a robust login and registration process. To register, you'll need to provide your email address, phone number, and password. We'll then verify your registration by sending a verification link or 4-5 digit code to your phone number. And if you ever forget your password, we've got you covered with our Forgot Password feature.

In addition to connecting with other sports enthusiasts, our app also allows you to update your personal details and preferences through the Setting & Privacy menu. You can change your password, update your email address, and even update your username if you want to switch things up.

We hope you enjoy using our app as much as we enjoyed creating it. Whether you're looking for a new workout buddy or just want to talk sports with like-minded individuals, our app is the perfect solution. So download the app today and start networking with other sports enthusiasts in your community!''',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.h),
                Text(' Sportsflickr Team', style: redHatDisplayBold14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
