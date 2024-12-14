import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MySharedKeys { apiToken, role, language, userId, email, password }

abstract class MySharedPrefInterface {
  Future<SharedPreferences> initSP();

  void putBoolean({required MySharedKeys key, required bool value});

  bool? getBoolean({required MySharedKeys key});

  void putString({required MySharedKeys key, required String? value});

  String getString({required MySharedKeys key});

  Future<bool>? clearShared();

  String getCurrentLanguage();

  SharedPreferences get preferences;
}

class MySharedPref extends MySharedPrefInterface {
  late SharedPreferences _preferences;

  @override
  Future<SharedPreferences> initSP() async {
    printTest('initSP');
    return _preferences = await SharedPreferences.getInstance();
  }

  // get instance of shared preferences
  @override
  SharedPreferences get preferences {
    return _preferences;
  }

  @override
  void putBoolean({
    required MySharedKeys key,
    required bool value,
  }) async {
    await _preferences.setBool(key.name, value);
  }

  @override
  bool? getBoolean({required MySharedKeys key}) {
    return _preferences.getBool(key.name);
  }

  @override
  void putString({
    required MySharedKeys key,
    required String? value,
  }) async {
    await _preferences.setString(key.name, value ?? "");
  }

  @override
  String getString({required MySharedKeys key}) {
    return _preferences.getString(key.name) ?? "";
  }

  @override
  Future<bool>? clearShared() {
    return _preferences.clear();
  }

  @override
  String getCurrentLanguage() {
    return _preferences.getString(MySharedKeys.language.name) ?? "en";
  }
}

void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}

void printError(String text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}

void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}
