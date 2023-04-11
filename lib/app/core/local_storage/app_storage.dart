import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppStorage {
  // ignore: unused_field
  Box? _box;

  /// for initialling app local storage
  Future<void> initAppStorage() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('octaden_storage');
  }

  Future<void> put<T>(String key, T value) async {
    await _box?.put(key, value);
  }

  T get<T>(String key) {
    return _box?.get(key) as T;
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _box?.clear();
  }
}

// final appStorageProvider = Provider<AppStorage>(
//   (_) {
//     throw UnimplementedError();
//     // return
//   },
// );

final hiveStorageProvider = Provider((ref) => AppStorage());
