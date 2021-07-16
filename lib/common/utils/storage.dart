import 'package:flutter_application_1/common/values/values.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:localstorage/localstorage.dart';

/// 本地存储
/// 单例 StorageUtil().getItem('key')
class StorageUtil {
  static final StorageUtil _singleton = new StorageUtil._internal();
  LocalStorage _storage = new LocalStorage(STORAGE_MASTER_KEY);

  factory StorageUtil() {
    return _singleton;
  }

  StorageUtil._internal() {
    _storage = new LocalStorage(STORAGE_MASTER_KEY);
  }
  // 此处修改，是可能返回空
  String? getItem(String key) {
    return _storage.getItem(key);
  }

  Future<void> setItem(String key, String val) async {
    await _storage.setItem(key, val);
  }
}
