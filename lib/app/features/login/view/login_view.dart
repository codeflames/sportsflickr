import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/login/model/login_model.dart';
import 'package:sportsflickr/app/features/login/model/login_request/login_request.dart';
import 'package:sportsflickr/app/features/login/providers/login_providers.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/register/view/register_view.dart';
import 'package:sportsflickr/gen/assets.gen.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _phoneController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final TextEditingController codeController = TextEditingController();

  void clearControllers() {
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    codeController.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showEmailField = ref.watch(showEmailFieldProvider);

    ref.listen<LoginState>(loginControllerProvider, (prev, next) {
      if (prev != next && next.isCodeSent == true) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Enter OTP"),
                const SizedBox(width: 8),
                //cancel
                TextButton(
                    onPressed: () {
                      clearControllers();
                      context.pop();
                    },
                    child: const Icon(Icons.close)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: codeController,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(onPressed: () {}, child: Text("Resend")),
              TextButton(
                child: const Text("Done"),
                onPressed: () => ref
                    .read(loginControllerProvider.notifier)
                    .loginWithOtpForCredential(
                        codeController.text, next.verificationId ?? ''),
              ),
            ],
          ),
        );
      } else if (next.isLoggedIn == true) {
        context.goNamed(ProfileView.routeName);
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sportsflickrScreenHeight(context),
          padding: paddingH24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.logoSportsflickrSvg,
                  width: 100.h, height: 100.h),
              Text(
                'SportsFlickr',
                style: redHatDisplayBold20,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Expanded(
                    child: showEmailField
                        ? SportsflickrEmailField(
                            controller: _emailController,
                          )
                        : SportsflickrTextFormField(
                            labelText: 'Phone Number',
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                          ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () {
                      _emailController.clear();
                      _phoneController.clear();
                      ref.read(showEmailFieldProvider.notifier).state =
                          !showEmailField;

                      ref
                          .read(loginControllerProvider.notifier)
                          .switchEmailOrPhoneLogin(
                              ref.read(showEmailFieldProvider));
                    },
                    child: Icon(
                        showEmailField == true
                            ? Icons.phone_android
                            : Icons.email_rounded,
                        size: 24.w,
                        color: five36BE5),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SportsflickrPasswordField(
                controller: _passwordController,
              ),
              SizedBox(height: 16.h),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      style: textButtonStyle.copyWith(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 0)),
                      ),
                      onPressed: () {},
                      child: const Text('Forgot Password?'))),
              SizedBox(height: 16.h),
              ElevatedButton(
                style: primaryButtonStyle,
                onPressed: () {
                  ref.read(loginControllerProvider.notifier).login(
                        LoginRequest(
                          email: _emailController.text,
                          phoneNumber: _phoneController.text,
                          password: _passwordController.text,
                        ),
                      );
                },
                child: const Text('Login'),
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: redHatDisplayRegular14),
                  TextButton(
                      style: textButtonStyle.copyWith(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 0)),
                      ),
                      onPressed: () {
                        context.goNamed(RegisterView.routeName);
                      },
                      child: const Text('Register'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
