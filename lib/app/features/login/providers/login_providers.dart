import 'dart:async';
import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/firebase_error_helper/firebase_error_helper.dart';
import 'package:sportsflickr/app/features/login/model/login_model.dart';
import 'package:sportsflickr/app/features/login/model/login_request/login_request.dart';
import 'package:sportsflickr/app/features/register/model/sports_interest_state.dart';

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
        await ref
            .read(sportsInterestControllerProvider.notifier)
            .getUserSelectedSportsInterest();
        EasyLoading.showSuccess('Login Success');
        state = state.copyWith(isLoggedIn: true);
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      final error = FirebaseErrorHelper.getErrorMessage(e);
      EasyLoading.showError(error);
    } catch (e) {
      log(e.toString());
      EasyLoading.showError('An error occurred');
    } finally {
      EasyLoading.dismiss();
    }
    FirebaseAnalytics.instance.logLogin();
  }

  void logState() {
    log(state.toString());
  }

  void cleanState() {
    state = LoginState.initial();
  }

  void changeIsLoggedIn(bool isLoggedIn) {
    state = state.copyWith(isLoggedIn: isLoggedIn);
  }

  // Future<void> getuserInterests() async {
  //   await ref
  //       .read(sportsInterestControllerProvider.notifier)
  //       .getUserSelectedSportsInterest();
  // }

  void switchEmailOrPhoneLogin(bool isEmailLogin) {
    state = state.copyWith(isEmailLogin: isEmailLogin);
    log(state.toString());
  }
}
