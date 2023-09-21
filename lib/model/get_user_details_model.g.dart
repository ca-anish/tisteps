// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDetailsModel _$GetUserDetailsModelFromJson(Map<String, dynamic> json) =>
    GetUserDetailsModel(
      data: UserDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
      support: UserSupportDetailsModel.fromJson(
          json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDetailsModelToJson(
        GetUserDetailsModel instance) =>
    <String, dynamic>{
      'data': mapUserDetailsToJson(instance.data),
      'support': mapWalkInAddressToJson(instance.support),
    };
