// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorClass _$$_ErrorClassFromJson(Map<String, dynamic> json) =>
    _$_ErrorClass(
      status: json['status'] as String?,
      message: json['message'] as String?,
      error: json['error'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_ErrorClassToJson(_$_ErrorClass instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };
