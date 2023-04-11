// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorClass _$ErrorClassFromJson(Map<String, dynamic> json) {
  return _ErrorClass.fromJson(json);
}

/// @nodoc
mixin _$ErrorClass {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorClassCopyWith<ErrorClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorClassCopyWith<$Res> {
  factory $ErrorClassCopyWith(
          ErrorClass value, $Res Function(ErrorClass) then) =
      _$ErrorClassCopyWithImpl<$Res, ErrorClass>;
  @useResult
  $Res call(
      {String? status, String? message, String? error, List<dynamic>? data});
}

/// @nodoc
class _$ErrorClassCopyWithImpl<$Res, $Val extends ErrorClass>
    implements $ErrorClassCopyWith<$Res> {
  _$ErrorClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorClassCopyWith<$Res>
    implements $ErrorClassCopyWith<$Res> {
  factory _$$_ErrorClassCopyWith(
          _$_ErrorClass value, $Res Function(_$_ErrorClass) then) =
      __$$_ErrorClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status, String? message, String? error, List<dynamic>? data});
}

/// @nodoc
class __$$_ErrorClassCopyWithImpl<$Res>
    extends _$ErrorClassCopyWithImpl<$Res, _$_ErrorClass>
    implements _$$_ErrorClassCopyWith<$Res> {
  __$$_ErrorClassCopyWithImpl(
      _$_ErrorClass _value, $Res Function(_$_ErrorClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ErrorClass(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorClass implements _ErrorClass {
  _$_ErrorClass(
      {this.status, this.message, this.error, final List<dynamic>? data})
      : _data = data;

  factory _$_ErrorClass.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorClassFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final String? error;
  final List<dynamic>? _data;
  @override
  List<dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ErrorClass(status: $status, message: $message, error: $error, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorClass &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, error,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorClassCopyWith<_$_ErrorClass> get copyWith =>
      __$$_ErrorClassCopyWithImpl<_$_ErrorClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorClassToJson(
      this,
    );
  }
}

abstract class _ErrorClass implements ErrorClass {
  factory _ErrorClass(
      {final String? status,
      final String? message,
      final String? error,
      final List<dynamic>? data}) = _$_ErrorClass;

  factory _ErrorClass.fromJson(Map<String, dynamic> json) =
      _$_ErrorClass.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  String? get error;
  @override
  List<dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorClassCopyWith<_$_ErrorClass> get copyWith =>
      throw _privateConstructorUsedError;
}
