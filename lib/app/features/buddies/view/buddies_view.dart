import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuddiesView extends ConsumerWidget {
  const BuddiesView({Key? key}) : super(key: key);

  static const routeName = '/buddies';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('BuddiesView'),
      ),
    );
  }
}
