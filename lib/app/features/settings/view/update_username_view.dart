import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class UpdateUsernameView extends ConsumerWidget {
  UpdateUsernameView({super.key});

  static const routeName = '/settings/update-username';

  final TextEditingController _currentUsernameController =
      TextEditingController();
  final TextEditingController _newUsernameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('Update Username', style: redHatDisplayBold14),
        onPressed: () => context.goNamed(SettingsView.routeName),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: sportsflickrScreenHeight(context),
          padding: paddingH24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.h),
              Text(
                  'Warning:\nThis action cannot be undone.\nYour buddies might be confused if you change your username.\nAnother person can claim the username after 30 days\nYou will be logged out after updating your email address.',
                  style: redHatDisplayBold14.copyWith(color: fF0000)),
              SizedBox(height: 24.h),
              Text(
                'Enter your current username and your new username below.',
                style: redHatDisplayBold14,
              ),
              SizedBox(height: 24.h),
              SportsflickrTextFormField(
                labelText: 'Your current username',
                controller: _currentUsernameController,
              ),
              SizedBox(height: 24.h),
              SportsflickrTextFormField(
                labelText: 'Your new username',
                controller: _newUsernameController,
              ),
              SizedBox(height: 48.h),
              ElevatedButton(
                style: primaryButtonStyle,
                onPressed: () {},
                child: Text('Update Username', style: redHatDisplayBold14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
