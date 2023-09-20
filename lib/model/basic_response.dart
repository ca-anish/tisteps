import 'package:json_annotation/json_annotation.dart';

part 'basic_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasicResponse<T> {
  bool status;
  T data;
  String? message;
  String? error;

  BasicResponse(
      { this.status = true,
        required this.data,
        this.error,
        this.message});

  factory BasicResponse.fromJson(Map<String, dynamic> json) => BasicResponse(
      message: json['message'] as String?,
      error: json['error'] as String?,
      status: json['status'] ?? true,
      data: json['data'] ?? <String, dynamic>{});

  Map<String, dynamic> toJson() => {
    'status': status,
    'error': error,
    'message': message,
  };

  @override
  List<Object?> get props => [status, error, message];
}
