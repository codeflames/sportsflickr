import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_response.freezed.dart';
part 'general_response.g.dart';

@freezed
class GeneralResponse with _$GeneralResponse {
  factory GeneralResponse({
    String? status,
    String? message,
    List<dynamic>? data,
  }) = _GeneralResponse;

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseFromJson(json);
}
