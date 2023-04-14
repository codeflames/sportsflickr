import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState(
    this.username,
    this.phoneNumber,
    this.email,
    this.password,
    this.isRegistered,
    this.userDetailAdded,
  );

  factory RegisterState.initial() {
    return const RegisterState(
      null,
      null,
      null,
      null,
      false,
      false,
    );
  }

  final String? username;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final bool? isRegistered;
  final bool? userDetailAdded;

  RegisterState copyWith({
    String? username,
    String? phoneNumber,
    String? email,
    String? password,
    bool? isRegistered,
    bool? userDetailAdded,
  }) {
    return RegisterState(
      username ?? this.username,
      phoneNumber ?? this.phoneNumber,
      email ?? this.email,
      password ?? this.password,
      isRegistered ?? this.isRegistered,
      userDetailAdded ?? this.userDetailAdded,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [username, phoneNumber, email, password, isRegistered, userDetailAdded];
}
