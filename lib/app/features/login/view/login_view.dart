import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sportsflickr/app/core/firebase_error_helper/firebase_error_helper.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/login/model/login_model.dart';
import 'package:sportsflickr/app/features/login/model/login_request/login_request.dart';
import 'package:sportsflickr/app/features/login/providers/login_providers.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/register/model/sports_interest_state.dart';
import 'package:sportsflickr/app/features/register/view/register_view.dart';
import 'package:sportsflickr/gen/assets.gen.dart';

import 'package:firebase_auth/firebase_auth.dart';

final phoneAuthProvider = Provider((ref) => FirebaseAuth.instance);
final verificationCodeProvider = StateProvider<String>((ref) => '');
final showPhoneFieldProvider = StateProvider<bool>((ref) => true);

class LoginView extends ConsumerWidget {
  LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
    phoneController.clear();
    verificationCodeController.clear();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneAuth = ref.watch(phoneAuthProvider);
    final verificationCode = ref.watch(verificationCodeProvider);
    final showEmailField = ref.watch(showEmailFieldProvider);
    final showPhoneField = ref.watch(showPhoneFieldProvider);

    String initialCountry = 'NG';
    PhoneNumber number = PhoneNumber(isoCode: 'NG');

    ref.listen<LoginState>(loginControllerProvider, (prev, next) {
      if (prev != next && next.isLoggedIn == true) {
        clearControllers();
        context.goNamed(ProfileView.routeName);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: null,
        leading: null,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                _emailController.clear();

                ref.read(showEmailFieldProvider.notifier).state =
                    !showEmailField;

                ref
                    .read(loginControllerProvider.notifier)
                    .switchEmailOrPhoneLogin(ref.read(showEmailFieldProvider));
              },
              child: Row(
                children: [
                  Text(
                    showEmailField == true
                        ? 'Use Phone instead'
                        : 'Use Email instead',
                    style: redHatDisplayRegular14,
                  ),
                  Icon(
                      showEmailField == true
                          ? Icons.phone_android
                          : Icons.email_rounded,
                      size: 24.w,
                      color: five36BE5),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: paddingH24,
        child: showEmailField
            ? SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 32.h),
                      SvgPicture.asset(Assets.images.logoSportsflickrSvg,
                          width: 100.h, height: 100.h),
                      Text(
                        'SportsFlickr Email Login',
                        style: redHatDisplayBold20,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.h),
                      SportsflickrEmailField(
                        controller: _emailController,
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
                    ]),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 32.h),
                    SvgPicture.asset(Assets.images.logoSportsflickrSvg,
                        width: 100.h, height: 100.h),
                    Text(
                      'SportsFlickr Phone Login',
                      style: redHatDisplayBold20,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),
                    Visibility(
                      visible: showPhoneField,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // SportsflickrTextFormField(
                          //   controller: phoneController,
                          //   keyboardType: TextInputType.phone,
                          //   labelText: 'Phone Number',
                          // ),
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                              phoneController.text = number.phoneNumber!;
                            },
                            initialValue: number,
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG,
                              setSelectorButtonAsPrefixIcon: true,
                              leadingPadding: 20,
                            ),

                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,

                            // initialValue: number,
                            // textFieldController: phoneController,
                            formatInput: true,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputDecoration: inputDecoration,
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                          SizedBox(height: 24.h),
                          ElevatedButton(
                            style: primaryButtonStyle,
                            onPressed: () async {
                              try {
                                EasyLoading.show(
                                    status: 'Sending verification code...');
                                String phone = phoneController.text;
                                log(phone);
                                await phoneAuth.verifyPhoneNumber(
                                  phoneNumber: phone,
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) async {
                                    await FirebaseAuth.instance
                                        .signInWithCredential(credential);
                                    await ref
                                        .read(sportsInterestControllerProvider
                                            .notifier)
                                        .getUserSelectedSportsInterest();
                                    ref
                                        .read(showPhoneFieldProvider.notifier)
                                        .state = false;
                                    EasyLoading.showSuccess('Login success');
                                    ref
                                        .read(loginControllerProvider.notifier)
                                        .changeIsLoggedIn(true);
                                  },
                                  verificationFailed:
                                      (FirebaseAuthException e) {
                                    EasyLoading.showError(
                                        FirebaseErrorHelper.getErrorMessage(e));
                                    if (kDebugMode) {
                                      print(e);
                                    }
                                  },
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    // verificationCode.state = verificationId;
                                    ref
                                        .read(verificationCodeProvider.notifier)
                                        .state = verificationId;
                                    EasyLoading.showSuccess(
                                        'Verification code sent');
                                    ref
                                        .read(showPhoneFieldProvider.notifier)
                                        .state = false;
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {},
                                );
                              } on FirebaseAuthException catch (e) {
                                EasyLoading.showError(
                                    FirebaseErrorHelper.getErrorMessage(e));
                                if (kDebugMode) {
                                  print(e);
                                }
                              } catch (e) {
                                if (kDebugMode) {
                                  print(e);
                                }
                                EasyLoading.showError('Something went wrong');
                              }
                            },
                            child: const Text('Send verification code'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 64.h),
                    Visibility(
                      visible: !showPhoneField,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SportsflickrTextFormField(
                            controller: verificationCodeController,
                            keyboardType: TextInputType.phone,
                            labelText: 'Verification code',
                          ),
                          SizedBox(height: 24.h),
                          ElevatedButton(
                            style: primaryButtonStyle,
                            onPressed: () async {
                              try {
                                EasyLoading.show(status: 'Logging in...');
                                String verificationCodeValue =
                                    verificationCodeController.text;
                                final credential = PhoneAuthProvider.credential(
                                    verificationId: verificationCode,
                                    smsCode: verificationCodeValue);
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential);
                                await ref
                                    .read(sportsInterestControllerProvider
                                        .notifier)
                                    .getUserSelectedSportsInterest();
                                ref
                                    .read(showPhoneFieldProvider.notifier)
                                    .state = true;
                                EasyLoading.showSuccess('Login successful');
                                if (context.mounted) {
                                  context.goNamed(ProfileView.routeName);
                                }
                              } catch (e) {
                                if (kDebugMode) {
                                  print('error for login: $e');
                                }
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
