import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<bool> write(String key, String value);

  Future<String> read(String key);

  Future<bool> remove(String key);
}

class LocalStorageImpl implements LocalStorage {
  @override
  Future<bool> write(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool result = await pref.setString(key, value);
    return result;
  }

  @override
  Future<String> read(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String value = preferences.getString(key);
    return value;
  }

  @override
  Future<bool> remove(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
