import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_request.freezed.dart';
part 'register_user_request.g.dart';

@freezed
class RegisterUserRequest with _$RegisterUserRequest {
  factory RegisterUserRequest({
    String? email,
    String? password,
  }) = _RegisterUserRequest;

  factory RegisterUserRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserRequestFromJson(json);
}
