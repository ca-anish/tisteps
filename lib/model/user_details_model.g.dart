// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsModel _$UserDetailsModelFromJson(Map<String, dynamic> json) =>
    UserDetailsModel(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$UserDetailsModelToJson(UserDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
