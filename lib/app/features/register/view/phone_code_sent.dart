import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sportsflickr/app/core/firebase_error_helper/firebase_error_helper.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/login/providers/login_providers.dart';
import 'package:sportsflickr/app/features/login/view/login_view.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/register/providers/register_providers.dart';
import 'package:sportsflickr/app/features/register/view/select_sport_interests.dart';
import 'package:sportsflickr/gen/assets.gen.dart';

class PhoneCodeSentSentPage extends ConsumerWidget {
  PhoneCodeSentSentPage({super.key});

  static const routeName = '/register/phone-code-sent';

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneAuth = ref.watch(phoneAuthProvider);
    final verificationCode = ref.watch(verificationCodeProvider);
    final showPhoneField = ref.watch(showPhoneFieldProvider);

    PhoneNumber number = PhoneNumber(isoCode: 'NG');

    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text(
          'Add phone number',
          style: redHatDisplayBold16,
        ),
        onPressed: () => context.go(SelectSportsInterestPage.routeName),
      ),
      body: Padding(
        padding: paddingH24,
        child: SingleChildScrollView(
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
              const Text('Adding your phone number will help you login faster'),
              SizedBox(height: 32.h),
              Visibility(
                visible: showPhoneField,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        log(number.phoneNumber.toString());
                        phoneController.text = number.phoneNumber!;
                      },
                      initialValue: number,
                      onInputValidated: (bool value) {},
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
                        log('On Saved: $number');
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
                          await phoneAuth.verifyPhoneNumber(
                            phoneNumber: phone,
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              await FirebaseAuth.instance.currentUser
                                  ?.linkWithCredential(credential);

                              EasyLoading.showSuccess('Linking successful');
                              ref
                                  .read(loginControllerProvider.notifier)
                                  .changeIsLoggedIn(true);
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              EasyLoading.showError(
                                  FirebaseErrorHelper.getErrorMessage(e));
                              if (kDebugMode) {
                                log(e.toString());
                              }
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              // verificationCode.state = verificationId;
                              ref
                                  .read(verificationCodeProvider.notifier)
                                  .state = verificationId;
                              EasyLoading.showSuccess('Verification code sent');
                              ref.read(showPhoneFieldProvider.notifier).state =
                                  false;
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        } on FirebaseAuthException catch (e) {
                          EasyLoading.showError(
                              FirebaseErrorHelper.getErrorMessage(e));
                          if (kDebugMode) {
                            log(e.toString());
                          }
                        } catch (e) {
                          if (kDebugMode) {
                            log(e.toString());
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
                          EasyLoading.show(status: 'Linking your phone...');
                          String verificationCodeValue =
                              verificationCodeController.text;
                          final credential = PhoneAuthProvider.credential(
                              verificationId: verificationCode,
                              smsCode: verificationCodeValue);
                          await FirebaseAuth.instance.currentUser
                              ?.linkWithCredential(credential);
                          EasyLoading.showSuccess('Linking Successful');

                          ref.read(showPhoneFieldProvider.notifier).state =
                              true;
                          // clear all controllers
                          phoneController.clear();
                          verificationCodeController.clear();
                          ref
                              .read(loginControllerProvider.notifier)
                              .cleanState();
                          ref
                              .read(registerControllerProvider.notifier)
                              .cleanRegisterState();

                          if (context.mounted) {
                            context.goNamed(ProfileView.routeName);
                          }
                        } catch (e) {
                          if (kDebugMode) {
                            log('error for login: $e');
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              TextButton(
                onPressed: () {
                  context.goNamed(ProfileView.routeName);
                },
                child: const Text('Skip for now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
