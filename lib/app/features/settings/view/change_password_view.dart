import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

final _codeSentProvider = StateProvider<bool>((ref) => false);

class ChangePasswordView extends ConsumerWidget {
  const ChangePasswordView({super.key});

  static const routeName = '/settings/change-password';

  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final TextEditingController _confirmPasswordController =
      TextEditingController();

  static final TextEditingController _codeController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  static final _secondFormKey = GlobalKey<FormState>();

  clearAllControllers() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _codeController.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _codeSent = ref.watch(_codeSentProvider);
    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('Change Password', style: redHatDisplayBold14),
        onPressed: () {
          _codeSent
              ? ref.read(_codeSentProvider.notifier).state = false
              : log('state not changed');
          clearAllControllers();
          context.goNamed(SettingsView.routeName);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          height: sportsflickrScreenHeight(context),
          padding: paddingH24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: !_codeSent,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 24.h),
                      Text('Enter your email address to change your password',
                          style: redHatDisplayRegular14),
                      SizedBox(height: 24.h),
                      SportsflickrEmailField(
                        controller: _emailController,
                      ),
                      SizedBox(height: 48.h),
                      ElevatedButton(
                          style: primaryButtonStyle,
                          child: const Text('Continue'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref.read(_codeSentProvider.notifier).state = true;
                            }
                          }),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _codeSent,
                child: Form(
                  key: _secondFormKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                          'Enter the code sent to your email address and continue with your new password',
                          style: redHatDisplayRegular14),
                      SizedBox(height: 24.h),
                      SportsflickrTextFormField(
                        controller: _codeController,
                        labelText: 'Code',
                      ),
                      SizedBox(height: 24.h),
                      SportsflickrPasswordField(
                        controller: _passwordController,
                      ),
                      SizedBox(height: 24.h),
                      SportsflickrPasswordField(
                        controller: _confirmPasswordController,
                        labelText: 'Confirm password',
                        validator: (value) {
                          if (value!.isNotEmpty &&
                              value != _passwordController.text) {
                            return 'Password does not match';
                          } else if (value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 48.h),
                      ElevatedButton(
                          style: primaryButtonStyle,
                          child: const Text('Change Password'),
                          onPressed: () {
                            ref.read(_codeSentProvider.notifier).state = false;
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
