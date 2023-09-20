import 'package:json_annotation/json_annotation.dart';
import 'package:tisteps/model/user_details_model.dart';
import 'package:tisteps/model/user_support_details_model.dart';

part 'user_response_model.g.dart';

List<Map<String, dynamic>?> mapUserDetailsToJson(
    List<UserDetailsModel> userList) {
  if (userList != null) {
    return userList.map((e) => e.toJson()).toList();
  } else {
    return [];
  }
}

Map<String, dynamic> mapWalkInAddressToJson(UserSupportDetailsModel userSupportDetails) {
  return userSupportDetails.toJson();
}

@JsonSerializable()
class UserResponseModel {
  @JsonKey(defaultValue: 0)
  int page;
  @JsonKey(defaultValue: 0,name: "per_page")
  int perPage;
  @JsonKey(defaultValue: 0)
  int total;
  @JsonKey(defaultValue: 0,name: "total_pages")
  int totalPages;
  @JsonKey(toJson: mapUserDetailsToJson)
  List<UserDetailsModel> data = [];
  @JsonKey(toJson: mapWalkInAddressToJson)
  UserSupportDetailsModel support;


  UserResponseModel({required this.page,required this.perPage,required this.total,required this.totalPages,required this.data,required this.support});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserListModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserListModelToJson(this);
}