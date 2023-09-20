import 'package:json_annotation/json_annotation.dart';

part 'user_details_model.g.dart';

@JsonSerializable()
class UserDetailsModel {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(defaultValue: '',name: "first_name")
  String firstName;
  @JsonKey(defaultValue: '',name: "last_name")
  String lastName;
  @JsonKey(defaultValue: '')
  String avatar;


  UserDetailsModel({required this.id,required this.email,required this.firstName,required this.lastName,required this.avatar});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsModelToJson(this);
}