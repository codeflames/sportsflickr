import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storageProvider = Provider((ref) => Storage());

// This class is used to store sensitive information such as API keys or
// user information. It uses the FlutterSecureStorage library to store
// data in the device's keychain. The Storage class should be used
// whenever sensitive information needs to be stored.
class Storage {
  final _storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    try {
      return _storage.read(key: key);
    } catch (e) {
      // handle error
      return null;
    }
  }

  Future<Map<String, String>> readAll() async {
    try {
      return _storage.readAll();
    } catch (e) {
      // handle error
      return {};
    }
  }

  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      // handle error
    }
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      // handle error
    }
  }

  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      // handle error
    }
  }
}

// final storage = context.read(storageProvider);

// String? value = await storage.read(key);
// Map<String, String> allValues = await storage.readAll();
// await storage.delete(key);
// await storage.deleteAll();
// await storage.write(key, value);
