// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool? isLoggedIn;
  final String? email;
  final String? password;
  final String? error;
  final String? phoneNumber;
  final bool? isEmailLogin;
  final bool? isCodeSent;
  final String? verificationId;
  final int? resendToken;
  const LoginState({
    this.isLoggedIn,
    this.email,
    this.password,
    this.error,
    this.phoneNumber,
    this.isEmailLogin,
    this.isCodeSent,
    this.verificationId,
    this.resendToken,
  });

  factory LoginState.initial() {
    return const LoginState(
      isLoggedIn: null,
      isEmailLogin: true,
      password: null,
      email: null,
      error: null,
      phoneNumber: null,
      isCodeSent: false,
      verificationId: null,
      resendToken: null,
    );
  }

  LoginState copyWith({
    bool? isLoggedIn,
    String? email,
    String? password,
    String? error,
    String? phoneNumber,
    bool? isEmailLogin,
    bool? isCodeSent,
    String? verificationId,
    int? resendToken,
  }) {
    return LoginState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isEmailLogin: isEmailLogin ?? this.isEmailLogin,
      isCodeSent: isCodeSent ?? this.isCodeSent,
      verificationId: verificationId ?? this.verificationId,
      resendToken: resendToken ?? this.resendToken,
    );
  }

  @override
  String toString() {
    return 'LoginState(isLoggedIn: $isLoggedIn, email: $email, password: $password, error: $error, phoneNumber: $phoneNumber, isEmailLogin: $isEmailLogin, isCodeSent: $isCodeSent, verificationId: $verificationId, resendToken: $resendToken)';
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      isLoggedIn,
      email,
      password,
      error,
      phoneNumber,
      isEmailLogin,
      isCodeSent,
      verificationId,
      resendToken,
    ];
  }
}
