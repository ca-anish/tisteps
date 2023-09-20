// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserListModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      page: json['page'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 0,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: UserSupportDetailsModel.fromJson(
          json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserListModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': mapUserDetailsToJson(instance.data),
      'support': mapWalkInAddressToJson(instance.support),
    };
