import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/firebase_error_helper/firebase_error_helper.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/login/view/login_view.dart';
import 'package:sportsflickr/gen/assets.gen.dart';

class ForgotPasswordView extends ConsumerWidget {
  ForgotPasswordView({super.key});

  static const routeName = '/login/forgot-password';

  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: SportsflickrAppBar(
          leading: SizedBox.shrink(),
          title: Text(
            'Forgot Password',
            style: redHatDisplayBold16,
          ),
        ),
        body: Padding(
          padding: paddingH24,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 32.h),
                Text(
                  'Enter your email address below and we will send you a link to reset your password.',
                  style: redHatDisplayBold14,
                ),
                SizedBox(height: 24.h),
                SportsflickrEmailField(
                  controller: _emailController,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  style: primaryButtonStyle,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    try {
                      EasyLoading.show(status: 'Sending reset link...');
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _emailController.text);

                      EasyLoading.showSuccess('Reset link sent!');
                      FirebaseAnalytics.instance.logEvent(
                          name: 'forgot_password_success',
                          parameters: {'email': _emailController.text});
                    } on FirebaseAuthException catch (e) {
                      EasyLoading.showError(
                          FirebaseErrorHelper.getErrorMessage(e));
                    } catch (e) {
                      EasyLoading.showError(
                          'Something went wrong!, Try again later');
                      FirebaseAnalytics.instance.logEvent(
                          name: 'forgot_password_error',
                          parameters: {'error': e.toString()});
                    }
                  },
                  child: const Text('Send Reset Link'),
                ),
                SizedBox(height: 48.h),
                TextButton(
                    style: textButtonStyle.copyWith(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 0)),
                    ),
                    onPressed: () {
                      context.go(LoginView.routeName);
                    },
                    child: const Text('Back to Login')),
              ],
            ),
          ),
        ));
  }
}
