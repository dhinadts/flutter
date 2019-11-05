import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preference {
  Future setString(String key, String string) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, string);
  }

  Future setint(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future setBool(String key, bool bool_value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, bool_value);
  }

  Future getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey(key);
    if (CheckValue == false) {
      prefs.setString(key, "");
    }
    return prefs.getString(key);
  }

  Future getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey(key);
    if (CheckValue == false) {
      await prefs.setInt(key, 0);
    }
    return await prefs.getInt(key);
  }

  Future getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey(key);
    if (CheckValue == false) {
      prefs.setBool(key, false);
      return prefs.getBool(key);
    }
  }

  void setInt(String s, int index) {}
}
