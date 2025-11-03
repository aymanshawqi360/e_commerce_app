import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static Future<String?> getData({required String cacheToken}) async {
    return await _storage.read(key: cacheToken) ?? "";
  }

  static Future<void> setData({
    required String cacheToken,
    required String value,
  }) async {
    await _storage.write(key: cacheToken, value: value);
  }

  static Future<void> delete({required String cacheToken}) async {
    await _storage.delete(key: cacheToken);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
