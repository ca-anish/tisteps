import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
  static final StorageService _singleton = StorageService._internal();

  String token = '';


  factory StorageService() {
    return _singleton;
  }

  StorageService._internal();

  Future<void> setJwtToken(String? jwkToken) async {
    if (jwkToken != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("jwtToken", jwkToken);
    }
  }

  Future<String> getJwtToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("jwtToken") ?? '';
  }
}
