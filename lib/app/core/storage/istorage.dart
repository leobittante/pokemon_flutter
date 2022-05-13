enum SharedKeys { email, password, name }

abstract class IStorage {
  Future<void> save(SharedKeys key, String value);

  Future<String> load<String>(SharedKeys key);

  Future<bool> clearAll();

  Future<bool> contains(SharedKeys key);
}
