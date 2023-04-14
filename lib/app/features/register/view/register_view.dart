import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/general_widgets/terms_and_privacy.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/login/view/login_view.dart';
import 'package:sportsflickr/app/features/register/model/register_model.dart';
import 'package:sportsflickr/app/features/register/providers/register_providers.dart';
import 'package:sportsflickr/app/features/register/view/select_sport_interests.dart';
import 'package:sportsflickr/gen/assets.gen.dart';

class RegisterView extends ConsumerWidget {
  RegisterView({Key? key}) : super(key: key);

  static const routeName = '/register';

  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
  static final TextEditingController _confirmPasswordController =
      TextEditingController();
  static final TextEditingController _usernameController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<RegisterState>(registerControllerProvider, (prev, next) {
      if (prev != next && next.isRegistered == true) {
        context.goNamed(SelectSportsInterestPage.routeName);
      }
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: sportsflickrScreenHeight(context),
            padding: paddingH24,
            child: Form(
              key: _formKey,
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
                  SportsflickrEmailField(
                    controller: _emailController,
                  ),

                  SizedBox(height: 16.h),
                  SportsflickrTextFormField(
                    labelText: 'Username',
                    controller: _usernameController,
                    validatorMessage: 'Please enter a username',
                  ),
                  SizedBox(height: 16.h),
                  SportsflickrPasswordField(
                    controller: _passwordController,
                  ),
                  SizedBox(height: 16.h),
                  //Textfield for confirm password
                  //Validates if password and confirm password are the same
                  SportsflickrPasswordField(
                    controller: _confirmPasswordController,
                    labelText: 'Confirm password',
                    validator: (value) {
                      if (value!.isNotEmpty &&
                          value.toLowerCase() !=
                              _passwordController.text.toLowerCase()) {
                        return 'Password does not match';
                      } else if (value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.h),
                  ElevatedButton(
                    style: primaryButtonStyle,
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _usernameController.text.length >= 3) {
                        ref
                            .read(registerControllerProvider.notifier)
                            .registerUser(
                                email: _emailController.text,
                                password: _passwordController.text,
                                username: _usernameController.text);
                      }
                    },
                    child: const Text('Register'),
                  ),
                  SizedBox(height: 8.h),
                  const TermsAndPrivacy(),
                  SizedBox(height: 48.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                          style: redHatDisplayRegular14),
                      TextButton(
                          style: textButtonStyle.copyWith(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 0)),
                          ),
                          onPressed: () {
                            context.goNamed(LoginView.routeName);
                          },
                          child: const Text('Login'))
                    ],
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
