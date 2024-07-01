import 'package:shared_preferences/shared_preferences.dart';

String? token = CacheHelper.getData(key: 'token');
String? page = CacheHelper.getData(key: 'collection');
bool? splash = CacheHelper.getData(key: 'splash');

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData(
      {required String key, required bool value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);
    return null;
  }

  static Future<bool?> clearData({
    required String key,
  }) async {
    return await sharedPreferences?.remove(key);
  }
}
