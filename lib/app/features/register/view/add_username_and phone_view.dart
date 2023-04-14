import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/register/providers/register_providers.dart';
import 'package:sportsflickr/app/features/register/view/phone_code_sent.dart';

class AddUsernameAndPhoneView extends ConsumerWidget {
  const AddUsernameAndPhoneView({super.key});

  static const routeName = '/addUsernameAndPhone';
  static final TextEditingController _usernameController =
      TextEditingController();
  static final TextEditingController _phoneNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: sportsflickrScreenHeight(context),
            padding: paddingH24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // add a smiling emoji after one more step
                  'One more step 🥳',
                  style: redHatDisplayBold20,
                ),
                SizedBox(height: 32.h),
                SportsflickrTextFormField(
                  labelText: 'Username',
                  controller: _usernameController,
                ),
                SizedBox(height: 16.h),
                SportsflickrTextFormField(
                  labelText: 'Phone number',
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.h),
                SizedBox(height: 32.h),
                ElevatedButton(
                  style: primaryButtonStyle,
                  onPressed: () {
                    ref
                        .read(registerControllerProvider.notifier)
                        .addUserDetails(
                          username: _usernameController.text,
                          phoneNumber: _phoneNumberController.text,
                        );
                    context.goNamed(PhoneCodeSentSentPage.routeName);
                  },
                  child: const Text('Continue'),
                ),
                SizedBox(height: 8.h),
                TextButton(
                  onPressed: () {
                    context.goNamed(ProfileView.routeName);
                  },
                  child: const Text('Skip for now'),
                ),
                SizedBox(height: 48.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
