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

class UpdateEmailView extends ConsumerWidget {
  UpdateEmailView({super.key});

  static const routeName = '/settings/update-email';

  final TextEditingController _currentEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(SettingsView.routeName);
        return false;
      },
      child: Scaffold(
        appBar: SportsflickrAppBar(
          title: Text('Update Email', style: redHatDisplayBold14),
          onPressed: () => context.goNamed(SettingsView.routeName),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: sportsflickrScreenHeight(context),
            padding: paddingH24,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 48.h),
                  Text(
                    'Type your current email address "${ref.read(userChangesProvider).valueOrNull?.email}" \nand your new email address below.',
                    style: redHatDisplayBold14,
                  ),
                  SizedBox(height: 24.h),
                  SportsflickrEmailField(
                    labelText: 'Your current email address',
                    controller: _currentEmailController,
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your current email address';
                      } else if (value.toLowerCase() !=
                          ref
                              .read(userChangesProvider)
                              .valueOrNull
                              ?.email
                              ?.toLowerCase()) {
                        return 'Your current email address is incorrect';
                      } else if (value == _newEmailController.text) {
                        return 'Your new email address is the same as your current email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24.h),
                  SportsflickrEmailField(
                    labelText: 'Your new email address',
                    controller: _newEmailController,
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your new email address';
                      } else if (value == _currentEmailController.text) {
                        return 'Your new email address is the same as your current email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 48.h),
                  ElevatedButton(
                    style: primaryButtonStyle,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        try {
                          EasyLoading.show(status: 'Updating email...');
                          FirebaseAuth.instance.currentUser
                              ?.updateEmail(_newEmailController.text)
                              .then((value) {
                            EasyLoading.dismiss();
                            context.goNamed(ProfileView.routeName);
                          });
                        } on FirebaseAuthException catch (e) {
                          EasyLoading.showError(
                              FirebaseErrorHelper.getErrorMessage(e));
                        } catch (error) {
                          log(error.toString());
                          EasyLoading.dismiss();
                          EasyLoading.showError('Something went wrong');
                        }
                      }

                      // FirebaseAuth.instance.currentUser
                      //     ?.updateEmail(_newEmailController.text);
                    },
                    child: Text('Update Email', style: redHatDisplayBold14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
