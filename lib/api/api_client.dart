import 'package:dio/dio.dart';
import 'package:tisteps/api/endpoints.dart';
import 'package:tisteps/services/storage.service.dart';

class ApiClient {
  Dio? _dio;
  static final BaseOptions _options = BaseOptions(baseUrl: EndPoints.baseUrl);

  static final ApiClient instance = ApiClient._internal();

  ApiClient._internal() {
    _dio ??= newDio();
  }

  static Dio newDioURL(String baseUrl) {
    return Dio(BaseOptions(baseUrl: baseUrl));
  }

  Dio newDio({String? baseURL, bool isDiff = false}) {
    Dio dio = Dio(_options);
    dio.options.contentType = "application/json";
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      var token = await StorageService().getJwtToken();
      if (token != '') {
        options.headers["Authorization"] = "Bearer $token";
      }
      handler.next(options);
    }, onResponse: (e, handler) {
      handler.next(e);
    }, onError: (e, handler) {
      handler.next(e);
    }));
    return dio;
  }

  Dio get dio => _dio!;
}

class ApiInterceptors extends Interceptor {}
