import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // make this a singleton class
  CacheHelper._privateConstructor();
  static final CacheHelper instance = CacheHelper._privateConstructor();

  // only have a single app-wide reference to the SharedPreferences
  static Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  // Helper methods

  static Future setInt(String key, int value) async {
    final p = await sharedPreferences;
    return p.setInt(key, value);
  }

  static Future<int> getInt({required String key}) async {
    final p = await sharedPreferences;
    return p.getInt(key) ?? 0;
  }

  static Future setBool(String key, bool value) async {
    final p = await sharedPreferences;
    return p.setBool(key, value);
  }

  static Future<bool?> getBool({required String key}) async {
    final p = await sharedPreferences;
    return p.getBool(key);
  }

  static Future setString(String key, String value) async {
    final p = await sharedPreferences;
    return p.setString(key, value);
  }

  static Future<String> getString({required String key}) async {
    final p = await sharedPreferences;
    return p.getString(key) ?? '';
  }

  static Future setDouble(String key, double value) async {
    final p = await sharedPreferences;
    return p.setDouble(key, value);
  }

  static Future<double> getDouble({required String key}) async {
    final p = await sharedPreferences;
    return p.getDouble(key) ?? 0.0;
  }

  static Future setData(String key, dynamic value) async {
    final p = await sharedPreferences;

    if (value is int) return p.setInt(key, value);
    if (value is bool) return await p.setBool(key, value);
    if (value is String) return await p.setString(key, value);
    if (value is double) return await p.setDouble(key, value);
    return null;
  }

  // static Future<dynamic> getData({required String key}) async {
  //   final p = await sharedPreferences;
  // }

  static Future<bool?> removeData({required String key}) async {
    final p = await sharedPreferences;
    return p.remove(key);
  }
}
