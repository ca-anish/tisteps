// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_support_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSupportDetailsModel _$UserSupportDetailsModelFromJson(
        Map<String, dynamic> json) =>
    UserSupportDetailsModel(
      url: json['url'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$UserSupportDetailsModelToJson(
        UserSupportDetailsModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
