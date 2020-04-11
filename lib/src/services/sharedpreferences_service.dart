import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_app/src/constants/enums.dart';
import 'package:workout_app/src/constants/keys.dart';

class SharedPrefsService {
  String _mode;
  String get mode => _mode;

  int _setsNumber;
  int get setsNumber => _setsNumber;

  getMode() async {
    var mode = await _getValue(modeKey);
    _mode = mode;
  }

  saveMode(Mode mode) async {
    String modeToSave = modeToString(mode);
    _mode = modeToSave;
    await _saveValue(
      modeKey,
      modeToSave,
    );
  }

  getSetsNumber() async {
    var setsNumber = await _getValue(setsNumberKey);
    _setsNumber = setsNumber;
  }

  saveSetsNumber(int setsNumber) async {
    int setsNumberToSave = setsNumber;
    _setsNumber = setsNumberToSave;
    await _saveValue(
      setsNumberKey,
      setsNumberToSave,
    );
  }

  Future _saveValue(String key, var content) async {
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

  Future _getValue(String key) async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    var value = await _sharedPreferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }
}
