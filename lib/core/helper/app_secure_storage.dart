import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<String?> readValue(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> writeValue(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }

  static Future<void> deleteValue(String key) async {
    return await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }

  static Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}
