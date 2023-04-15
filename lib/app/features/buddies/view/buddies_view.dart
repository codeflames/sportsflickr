import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

class BuddiesView extends ConsumerWidget {
  const BuddiesView({Key? key}) : super(key: key);

  static const routeName = '/buddies';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 36.h),
        Icon(Icons.people, size: 50.w, color: five36BE5),
        SizedBox(height: 24.h),
        const Text(
          'Buddies is Coming Soon!',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        const Text(
          'Stay tuned for updates.',
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }
}
