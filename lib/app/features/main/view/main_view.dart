import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/buddies/view/buddies_view.dart';
import 'package:sportsflickr/app/features/discover/view/discover_view.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key, required this.child}) : super(key: key);

  static const routeName = '/main';
  final Widget child;

  @override
  ConsumerState<MainView> createState() => MainViewState();
}

class MainViewState extends ConsumerState<MainView> {
  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    switch (location) {
      case '/profile':
        return 0;
      case '/buddies':
        return 1;
      case '/discover':
        return 2;
      case '/settings':
        return 3;
      default:
        return 0;
    }
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        return context.goNamed(ProfileView.routeName);
      case 1:
        return context.goNamed(BuddiesView.routeName);
      case 2:
        return context.goNamed(DiscoverView.routeName);
      case 3:
        return context.goNamed(SettingsView.routeName);

      default:
        return context.goNamed(ProfileView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? returnValue;
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you want to exit the app?'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('No')),
                  TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Yes')),
                ],
              );
            }).then((value) {
          if (value == true) {
            returnValue = true;
          } else {
            returnValue = false;
          }
        });
        return returnValue!;
      },
      child: Scaffold(
          // appBar: AppBar(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _calculateSelectedIndex(context),
            type: BottomNavigationBarType.fixed,
            onTap: onTap, // onTap: (value) => onTap(value),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  activeIcon:
                      Icon(Icons.account_circle_rounded, color: five36BE5),
                  label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline),
                  activeIcon: Icon(Icons.people_rounded, color: five36BE5),
                  label: 'Buddies'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Icon(Icons.explore_rounded, color: five36BE5),
                  label: 'Discover'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings_rounded, color: five36BE5),
                  label: 'Settings'),
            ],
          ),
          body: widget.child),
    );
  }
}
