import 'package:shared_preferences/shared_preferences.dart';

import '../errors/exceptions.dart';
import 'istorage.dart';

class StorageSharedPreferences implements IStorage {
  @override
  Future<void> save(SharedKeys key, String value) async {
    try {
      final _sharedPrefs = await SharedPreferences.getInstance();
      _sharedPrefs.setString(key.name, value);
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<String> load<String>(SharedKeys key) async {
    final hasKey = await contains(key);
    if (!hasKey) {
      throw KeyNotFoundException();
    }
    final _sharedPrefs = await SharedPreferences.getInstance();
    try {
      return _sharedPrefs.getString(key.name) as String;
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<bool> clearAll() async {
    try {
      final _sharedPrefs = await SharedPreferences.getInstance();
      final result = await _sharedPrefs.clear();
      if (result) {
        return result;
      }
      throw ClearStorageException();
    } on ClearStorageException {
      rethrow;
    } catch (e) {
      throw StorageException();
    }
  }

  @override
  Future<bool> contains(SharedKeys key) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs.containsKey(key.name);
  }
}
