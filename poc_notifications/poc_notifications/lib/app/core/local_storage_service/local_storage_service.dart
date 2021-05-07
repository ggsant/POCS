abstract class LocalStorageService {
  Future<List<Map>?> get(String key);
  Future<void> delete(String key);
  Future<void> save(String key, List<Map> value);
}
