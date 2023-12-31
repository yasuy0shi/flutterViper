import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  late SharedPreferences sharedPrefs;

  void init() {
    SharedPreferences.getInstance()
        .then((SharedPreferences value) => sharedPrefs = value);
  }
}

final Preference prefs = Preference();

bool get isLoggedIn {
  return (prefs.sharedPrefs.getBool(prefsLoginValue)) ?? false;
}

Future<bool> setIsLoggedIn(bool value) async {
  final bool val = await prefs.sharedPrefs.setBool(prefsLoginValue, value);
  return val;
}

Future<void> clearAllData({bool keepLanguage = true}) async {
  prefs.sharedPrefs.clear();
}

const String prefsLoginValue = "loginValue";
