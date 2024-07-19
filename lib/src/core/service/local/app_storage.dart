import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum StorageKey {
  token,
  pinCode,
}

class AppStorage {
  factory AppStorage() => _service;

  const AppStorage._internal();

  static const AppStorage _service = AppStorage._internal();
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<String?> read(StorageKey key) async {
    final String? value = await _storage.read(key: key.name);
    return value;
  }

  static Future<void> write(StorageKey key, String value) async {
    await _storage.write(key: key.name, value: value);
  }

  static Future<void> clearAllData() async {
    await _storage.deleteAll();
  }
}
