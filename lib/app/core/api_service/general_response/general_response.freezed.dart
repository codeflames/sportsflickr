// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralResponse _$GeneralResponseFromJson(Map<String, dynamic> json) {
  return _GeneralResponse.fromJson(json);
}

/// @nodoc
mixin _$GeneralResponse {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralResponseCopyWith<GeneralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralResponseCopyWith<$Res> {
  factory $GeneralResponseCopyWith(
          GeneralResponse value, $Res Function(GeneralResponse) then) =
      _$GeneralResponseCopyWithImpl<$Res, GeneralResponse>;
  @useResult
  $Res call({String? status, String? message, List<dynamic>? data});
}

/// @nodoc
class _$GeneralResponseCopyWithImpl<$Res, $Val extends GeneralResponse>
    implements $GeneralResponseCopyWith<$Res> {
  _$GeneralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeneralResponseCopyWith<$Res>
    implements $GeneralResponseCopyWith<$Res> {
  factory _$$_GeneralResponseCopyWith(
          _$_GeneralResponse value, $Res Function(_$_GeneralResponse) then) =
      __$$_GeneralResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, List<dynamic>? data});
}

/// @nodoc
class __$$_GeneralResponseCopyWithImpl<$Res>
    extends _$GeneralResponseCopyWithImpl<$Res, _$_GeneralResponse>
    implements _$$_GeneralResponseCopyWith<$Res> {
  __$$_GeneralResponseCopyWithImpl(
      _$_GeneralResponse _value, $Res Function(_$_GeneralResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_GeneralResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
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
class _$_GeneralResponse implements _GeneralResponse {
  _$_GeneralResponse({this.status, this.message, final List<dynamic>? data})
      : _data = data;

  factory _$_GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GeneralResponseFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
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
    return 'GeneralResponse(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneralResponseCopyWith<_$_GeneralResponse> get copyWith =>
      __$$_GeneralResponseCopyWithImpl<_$_GeneralResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneralResponseToJson(
      this,
    );
  }
}

abstract class _GeneralResponse implements GeneralResponse {
  factory _GeneralResponse(
      {final String? status,
      final String? message,
      final List<dynamic>? data}) = _$_GeneralResponse;

  factory _GeneralResponse.fromJson(Map<String, dynamic> json) =
      _$_GeneralResponse.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  List<dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralResponseCopyWith<_$_GeneralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
