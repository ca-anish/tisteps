import 'package:dio/dio.dart';
import 'package:tisteps/api/api_client.dart';
import 'package:tisteps/api/api_exception.dart';
import 'package:tisteps/api/endpoints.dart';
import 'package:tisteps/model/basic_response.dart';
import 'package:tisteps/model/user_response_model.dart';

import '../model/get_user_details_model.dart';

class UserDataService {
  Future<UserResponseModel> getUserList(int page) async {
    try {
      Response apiResponse = await ApiClient.instance.dio
          .get(EndPoints.getUsers, queryParameters: {"page": page});
      return UserResponseModel.fromJson(apiResponse.data);
    } on DioError catch (e) {
      BasicResponse basicResponse = BasicResponse.fromJson(e.response?.data);
      throw AuthException(message: basicResponse.error);
    } catch (e) {
      throw AuthException(message: 'Something Went Wrong');
    }
  }

  Future<GetUserDetailsModel> getUserDetails(int userId) async {
    try {
      Response apiResponse = await ApiClient.instance.dio.get(
        '${EndPoints.getUsers}/$userId',
      );
      return GetUserDetailsModel.fromJson(apiResponse.data);
    } on DioError catch (e) {
      BasicResponse basicResponse = BasicResponse.fromJson(e.response?.data);
      throw AuthException(message: basicResponse.error);
    } catch (e) {
      throw AuthException(message: 'Something Went Wrong');
    }
  }
}
