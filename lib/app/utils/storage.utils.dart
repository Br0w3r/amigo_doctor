import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageUtils {
  static Future<String> getStringByKey(String key) async =>
      await const FlutterSecureStorage().read(
          key: key,
          aOptions: const AndroidOptions(encryptedSharedPreferences: true)) ??
      '';

  static void setStringKey(String key, String value) async =>
      await const FlutterSecureStorage().write(
          key: key,
          value: value,
          aOptions: const AndroidOptions(encryptedSharedPreferences: true));

  static void removeAll() async =>
      await const FlutterSecureStorage().deleteAll();

  static Future<void> removeByKey(String key) async =>
      await const FlutterSecureStorage().delete(
          key: key,
          aOptions: const AndroidOptions(encryptedSharedPreferences: true));

  static void setBoolKey(String key, bool value) async {
    final stringValue = value.toString();
    await const FlutterSecureStorage().write(
        key: key,
        value: stringValue,
        aOptions: const AndroidOptions(encryptedSharedPreferences: true));
  }

  static Future<bool> getBoolByKey(String key) async {
    final stringValue = await const FlutterSecureStorage().read(
        key: key,
        aOptions: const AndroidOptions(encryptedSharedPreferences: true));
    if (stringValue != null) {
      return stringValue.toLowerCase() == 'true';
    }
    return false;
  }
}
