// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse<T> _$BasicResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasicResponse<T>(
      status: json['status'] as bool? ?? true,
      data: fromJsonT(json['data']),
      error: json['error'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BasicResponseToJson<T>(
  BasicResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'data': toJsonT(instance.data),
      'message': instance.message,
      'error': instance.error,
    };
