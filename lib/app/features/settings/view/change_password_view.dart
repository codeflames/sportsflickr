import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/firebase_error_helper/firebase_error_helper.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/profile/providers/profile_providers.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
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

  static final TextEditingController _oldPasswordController =
      TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  static final _secondFormKey = GlobalKey<FormState>();

  clearAllControllers() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _oldPasswordController.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeSent = ref.watch(_codeSentProvider);
    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('Change Password', style: redHatDisplayBold14),
        onPressed: () {
          codeSent
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
                visible: !codeSent,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          } else if (ref
                                  .read(userChangesProvider)
                                  .valueOrNull!
                                  .email !=
                              _emailController.text.trim()) {
                            return 'Email does not match with your current email';
                          }
                          return null;
                        },
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
                visible: codeSent,
                child: Form(
                  key: _secondFormKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                          'Enter the code sent to your old and  new password to change your password',
                          style: redHatDisplayRegular14),
                      SizedBox(height: 24.h),
                      SportsflickrPasswordField(
                        controller: _oldPasswordController,
                        labelText: 'Old password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your old password';
                          }
                          return null;
                        },
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
                          onPressed: () async {
                            // log all controllers
                            log('email: ${_emailController.text}');
                            log('old password: ${_oldPasswordController.text}');
                            log('new password: ${_passwordController.text}');
                            log('confirm password: ${_confirmPasswordController.text}');
                            if (_secondFormKey.currentState!.validate()) {
                              try {
                                final credential = EmailAuthProvider.credential(
                                    email: _emailController.text,
                                    password: _passwordController.text);

                                EasyLoading.show(status: 'Loading...');
                                await FirebaseAuth.instance.currentUser!
                                    .reauthenticateWithCredential(credential);
                                await FirebaseAuth.instance.currentUser!
                                    .updatePassword(
                                        _confirmPasswordController.text.trim());
                                EasyLoading.showSuccess('Password changed');

                                if (context.mounted) {
                                  context.goNamed(ProfileView.routeName);
                                }
                                clearAllControllers();
                              } on FirebaseAuthException catch (e) {
                                log(e.toString());
                                EasyLoading.showError(
                                    FirebaseErrorHelper.getErrorMessage(e));
                              } catch (e) {
                                log(e.toString());
                                EasyLoading.showError('Something went wrong');
                              } finally {
                                EasyLoading.dismiss();
                              }
                            }
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
