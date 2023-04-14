// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterUserRequest _$RegisterUserRequestFromJson(Map<String, dynamic> json) {
  return _RegisterUserRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserRequest {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterUserRequestCopyWith<RegisterUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserRequestCopyWith<$Res> {
  factory $RegisterUserRequestCopyWith(
          RegisterUserRequest value, $Res Function(RegisterUserRequest) then) =
      _$RegisterUserRequestCopyWithImpl<$Res, RegisterUserRequest>;
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class _$RegisterUserRequestCopyWithImpl<$Res, $Val extends RegisterUserRequest>
    implements $RegisterUserRequestCopyWith<$Res> {
  _$RegisterUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterUserRequestCopyWith<$Res>
    implements $RegisterUserRequestCopyWith<$Res> {
  factory _$$_RegisterUserRequestCopyWith(_$_RegisterUserRequest value,
          $Res Function(_$_RegisterUserRequest) then) =
      __$$_RegisterUserRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class __$$_RegisterUserRequestCopyWithImpl<$Res>
    extends _$RegisterUserRequestCopyWithImpl<$Res, _$_RegisterUserRequest>
    implements _$$_RegisterUserRequestCopyWith<$Res> {
  __$$_RegisterUserRequestCopyWithImpl(_$_RegisterUserRequest _value,
      $Res Function(_$_RegisterUserRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_RegisterUserRequest(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterUserRequest implements _RegisterUserRequest {
  _$_RegisterUserRequest({this.email, this.password});

  factory _$_RegisterUserRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterUserRequestFromJson(json);

  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'RegisterUserRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterUserRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterUserRequestCopyWith<_$_RegisterUserRequest> get copyWith =>
      __$$_RegisterUserRequestCopyWithImpl<_$_RegisterUserRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterUserRequestToJson(
      this,
    );
  }
}

abstract class _RegisterUserRequest implements RegisterUserRequest {
  factory _RegisterUserRequest({final String? email, final String? password}) =
      _$_RegisterUserRequest;

  factory _RegisterUserRequest.fromJson(Map<String, dynamic> json) =
      _$_RegisterUserRequest.fromJson;

  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterUserRequestCopyWith<_$_RegisterUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
