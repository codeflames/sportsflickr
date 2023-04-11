import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiscoverView extends ConsumerWidget {
  /// TODO add your comment here
  const DiscoverView({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('DiscoverView'),
      ),
    );
  }
}
