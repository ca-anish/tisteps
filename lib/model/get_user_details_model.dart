import 'package:json_annotation/json_annotation.dart';
import 'package:tisteps/model/user_details_model.dart';
import 'package:tisteps/model/user_support_details_model.dart';

part 'get_user_details_model.g.dart';

Map<String, dynamic> mapUserDetailsToJson(UserDetailsModel userDetailsModel) {
  return userDetailsModel.toJson();
}

Map<String, dynamic> mapWalkInAddressToJson(
    UserSupportDetailsModel userSupportDetails) {
  return userSupportDetails.toJson();
}

@JsonSerializable()
class GetUserDetailsModel {
  @JsonKey(toJson: mapUserDetailsToJson)
  UserDetailsModel data;
  @JsonKey(toJson: mapWalkInAddressToJson)
  UserSupportDetailsModel support;

  GetUserDetailsModel({required this.data, required this.support});

  factory GetUserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserDetailsModelToJson(this);
}
