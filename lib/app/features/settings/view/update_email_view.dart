import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class UpdateEmailView extends ConsumerWidget {
  UpdateEmailView({super.key});

  static const routeName = '/settings/update-email';

  final TextEditingController _currentEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('Update Email', style: redHatDisplayBold14),
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
                'Note: You will be logged out after updating your email address.',
                style: redHatDisplayBold14,
              ),
              Text(
                  'Warning: This action cannot be undone and you can not revert back to your previous email address.',
                  style: redHatDisplayBold14.copyWith(color: fF0000)),
              SizedBox(height: 24.h),
              Text(
                'Enter your current email address and your new email address below.',
                style: redHatDisplayBold14,
              ),
              SizedBox(height: 24.h),
              SportsflickrEmailField(
                labelText: 'Your current email address',
                controller: _currentEmailController,
              ),
              SizedBox(height: 24.h),
              SportsflickrEmailField(
                labelText: 'Your new email address',
                controller: _newEmailController,
              ),
              SizedBox(height: 48.h),
              ElevatedButton(
                style: primaryButtonStyle,
                onPressed: () {},
                child: Text('Update Email', style: redHatDisplayBold14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
