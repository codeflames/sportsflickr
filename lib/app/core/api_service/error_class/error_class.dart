import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_class.freezed.dart';
part 'error_class.g.dart';

@freezed
class ErrorClass with _$ErrorClass {
  factory ErrorClass({
    String? status,
    String? message,
    String? error,
    List<dynamic>? data,
  }) = _ErrorClass;

  factory ErrorClass.fromJson(Map<String, dynamic> json) =>
      _$ErrorClassFromJson(json);
}
