// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeneralResponse _$$_GeneralResponseFromJson(Map<String, dynamic> json) =>
    _$_GeneralResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_GeneralResponseToJson(_$_GeneralResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
