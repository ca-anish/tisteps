import 'package:json_annotation/json_annotation.dart';

part 'user_support_details_model.g.dart';

@JsonSerializable()
class UserSupportDetailsModel {
  @JsonKey(defaultValue: '')
  String url;
  @JsonKey(defaultValue: '')
  String text;


  UserSupportDetailsModel({required this.url,required this.text});

  factory UserSupportDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserSupportDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSupportDetailsModelToJson(this);
}