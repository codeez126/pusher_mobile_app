import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static final PrefManager _singleton = PrefManager._internal();
  static late final SharedPreferences _prefsInstance; // Making this late final.

  factory PrefManager() {
    return _singleton;
  }

  PrefManager._internal();

  // Asynchronous initialization of SharedPreferences
  // Call this method early in your app's lifecycle, before accessing PrefManager methods
  static Future<void> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
  }

  // Since _prefsInstance is now initialized synchronously, methods can be synchronous
  static dynamic read(String key) {
    return json.decode(_prefsInstance.getString(key)!);
  }

  static String getToken() {
    return _prefsInstance.getString('Token') ?? '';
  }

  static void setToken(String value) {
    try {
      _prefsInstance.setString('Token', value);
    } catch (ex) {
      print(ex);
    }
  }

  static void setIsLogin(bool value) {
    try {
      _prefsInstance.setBool('isLogin', value);
    } catch (ex) {
      print(ex);
    }
  }

  static bool isLogin() {
    return _prefsInstance.getBool('isLogin') ?? false;
  }

  static void save(String key, dynamic value) {
    try {
      _prefsInstance.setString(key, json.encode(value));
    } catch (ex) {
      print(ex);
    }
  }

  static void remove(String key) {
    _prefsInstance.remove(key);
  }

  static void clearAll() {
    _prefsInstance.clear();
  }

  // static LoginModel? getUserInfo() {
  //   try {
  //     if (_prefsInstance.containsKey('user_info')) {
  //       var model = read('user_info');
  //       LoginModel userModel = LoginModel.fromJson(model);
  //       return userModel;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  //   return null;
  // }
  //
  // static void setUserInfo(LoginModel model) {
  //   try {
  //     _prefsInstance.setString('user_info', json.encode(model));
  //   } catch (ex) {
  //     print(ex);
  //   }
  // }
}
