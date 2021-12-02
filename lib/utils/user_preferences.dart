import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<bool> onboardingDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingDone', true);
    return true;
  }

  static Future<bool> onboardingNotDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingDone', false);
    return true;
  }

  static Future<bool?> isOnboardingDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingDone');
  }
}