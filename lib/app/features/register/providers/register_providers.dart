// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/firebase_error_helper/firebase_error_helper.dart';
import 'package:sportsflickr/app/features/register/model/register_model.dart';

final authProvider = StreamProvider.autoDispose<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>(
        (ref) => RegisterController(ref));

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this.ref) : super(RegisterState.initial());

  final Ref ref;

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> registerUser(
      {required String email, required String password}) async {
    try {
      state = state.copyWith(
        email: email,
        password: password,
      );
      EasyLoading.show(status: 'Registering...');
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();
        EasyLoading.showSuccess('Verification Email Sent');

        state = state.copyWith(isRegistered: true);
      }
    } on FirebaseAuthException catch (e) {
      final errorCode = FirebaseErrorHelper.getErrorMessage(e);
      EasyLoading.showError(errorCode);
    } catch (e) {
      EasyLoading.showError('Error Registering');
      FirebaseAnalytics.instance.logEvent(name: 'register_error', parameters: {
        'error': e.toString(),
      });
    }
  }

  Future<void> addUserDetails(
      {required String username, required String phoneNumber}) async {
    try {
      state = state.copyWith(
        username: username,
        phoneNumber: phoneNumber,
      );
      EasyLoading.show(status: 'Adding Details...');
      await auth.currentUser!.updateDisplayName(username);
      // await auth.currentUser!.updatePhoneNumber(phoneNumber);

      EasyLoading.showSuccess('Details Added Successfully');
      state = state.copyWith(userDetailAdded: true);
    } on FirebaseAuthException catch (e) {
      final errorCode = FirebaseErrorHelper.getErrorMessage(e);
      EasyLoading.showError(errorCode);
    } catch (e) {
      EasyLoading.showError('Error Adding Details');
      FirebaseAnalytics.instance
          .logEvent(name: 'updating_user_error', parameters: {
        'error': e.toString(),
      });
    }
  }
}
