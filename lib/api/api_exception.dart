class ApiException implements Exception {
  String message;
  int? statusCode;

  ApiException({this.message = 'Something Went Wrong', this.statusCode});
}

class AuthException extends ApiException {
  AuthException({message, statusCode})
      : super(message: message, statusCode: statusCode);
}

class AppException extends ApiException {
  AppException({message, statusCode})
      : super(message: message, statusCode: statusCode);
}
