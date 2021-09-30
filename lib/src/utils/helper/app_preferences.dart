import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static AppPreferences? _instance;
  static Future<AppPreferences> get ins async {
    if (_instance == null) {
      final newIntance = AppPreferences();
      await newIntance.init();
      _instance = newIntance;
    }
    return _instance!;
  }
}
