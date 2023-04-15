import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

class DiscoverView extends ConsumerWidget {
  const DiscoverView({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 36.h),
        Icon(Icons.explore, size: 50.w, color: five36BE5),
        SizedBox(height: 24.h),
        const Text(
          'Discover is Coming Soon!',
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
