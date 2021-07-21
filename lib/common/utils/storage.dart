import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
/// 单例 StorageUtil().getItem('key')
class StorageUtil {
  static StorageUtil _instance = new StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences? _prefs;

  StorageUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  /// 设置 json 对象
  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs!.setString(key, jsonString);
  }

  /// 获取 json 对象
  dynamic getJSON(String key) {
    String? jsonString = _prefs!.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  /// 删除 json 对象
  Future<bool> remove(String key) {
    return _prefs!.remove(key);
  }
}

class Single {
  static final Single _single = Single._internal();
  static SharedPreferences? _prefs;

  Single._internal();
  factory Single() {
    return _single;
  }
  void test() {
    if (_prefs != null) {
      print('test $_prefs');
    }
  }

  static Future<void> init() async {
    print('init s $_prefs');
    _prefs = await SharedPreferences.getInstance();
    print('init e $_prefs');
  }
}
