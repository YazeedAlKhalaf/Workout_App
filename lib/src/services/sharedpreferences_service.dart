import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  Future saveValue(String key, var content) async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      await _sharedPreferences.setString(key, content);
    }
    if (content is bool) {
      await _sharedPreferences.setBool(key, content);
    }
    if (content is int) {
      await _sharedPreferences.setInt(key, content);
    }
    if (content is double) {
      await _sharedPreferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await _sharedPreferences.setStringList(key, content);
    }
  }

  Future getValue(String key) async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    var value = await _sharedPreferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }
}
