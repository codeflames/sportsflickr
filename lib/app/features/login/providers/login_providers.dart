import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/firebase_error_helper/firebase_error_helper.dart';
import 'package:sportsflickr/app/core/router/router.dart';
import 'package:sportsflickr/app/features/login/model/login_model.dart';
import 'package:sportsflickr/app/features/login/model/login_request/login_request.dart';
import 'package:sportsflickr/app/features/login/view/login_view.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
        (ref) => LoginController(ref));

final showEmailFieldProvider = StateProvider<bool>((ref) => true);

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(LoginState.initial());
  final Ref ref;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login(
    LoginRequest loginRequest,
  ) async {
    EasyLoading.show(status: 'Loading...');
    try {
      if (state.isEmailLogin == true) {
        await auth.signInWithEmailAndPassword(
            email: loginRequest.email!, password: loginRequest.password!);
        EasyLoading.showSuccess('Login Success');
        state = state.copyWith(isLoggedIn: true);
      } else {
        await phoneSignIn(
          loginRequest.phoneNumber.toString(),
        );
        EasyLoading.showSuccess('Login Success');
        state = state.copyWith(isLoggedIn: true);
        // await auth.signInWithPhoneNumber(loginRequest.phoneNumber!);
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      final error = FirebaseErrorHelper.getErrorMessage(e);
      EasyLoading.showError(error);
    } catch (e) {
      print(e);
      log(e.toString());
      EasyLoading.showError('An error occurred');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void logState() {
    log(state.toString());
  }

  void cleanState() {
    state = LoginState.initial();
  }

  void switchEmailOrPhoneLogin(bool isEmailLogin) {
    state = state.copyWith(isEmailLogin: isEmailLogin);
    log(state.toString());
  }

  Future<void> onVerificationCompleted(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final userSignIn = await auth.signInWithCredential(phoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      final error = FirebaseErrorHelper.getErrorMessage(e);
      EasyLoading.showError(error);
    } catch (e) {
      print(e);
      log(e.toString());
      EasyLoading.showError('An error occurred');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> codeSent(
    String verificationId,
    int? resendToken,
  ) async {
    state = state.copyWith(
        isCodeSent: true,
        verificationId: verificationId,
        resendToken: resendToken);
  }

  void loginWithOtpForCredential(String otp, verificationId) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId ?? '',
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      final error = FirebaseErrorHelper.getErrorMessage(e);
      EasyLoading.showError(error);
    } catch (e) {
      print(e);
      log(e.toString());
      EasyLoading.showError('An error occurred');
    } finally {
      EasyLoading.dismiss();
    }
  }

  // PHONE SIGN IN
  Future<void> phoneSignIn(
    String phoneNumber,
  ) async {
    // FOR ANDROID, IOS
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        //  Automatic handling of the SMS code
        verificationCompleted: onVerificationCompleted,
        // Displays a message when verification fails
        verificationFailed: (e) {
          EasyLoading.showError(FirebaseErrorHelper.getErrorMessage(e));
        },
        // Displays a dialog box when OTP is sent
        codeSent: codeSent,
        timeout: const Duration(seconds: 2),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
          EasyLoading.showError('Auto-resolution timed out');
          Completer();
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
