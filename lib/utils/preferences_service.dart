import 'package:shared_preferences/shared_preferences.dart';
import 'package:onboarding_drawer_save_prefs/models/setting_models.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.username);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setInt('gender', settings.gender.index);
    /*
    await preferences.setStringList(
        'programmingLanguages',
        settings.programmingLanguages
            .map((lang) => lang.index.toString())
            .toList());
*/
    print('Saved settings');
  }

  Future<Settings> getSettings() async {

    final preferences = await SharedPreferences.getInstance();
    final String username;
    if (preferences.getString('username') != null) {
      username = preferences.getString('username')!;
    } else {
      username = "";
    }
    final bool isEmployed;
    if (preferences.getBool('isEmployed') != null) {
      isEmployed = preferences.getBool('isEmployed')!;
    } else {
      isEmployed = false;
    }
    final Gender gender;
    if (preferences.getInt('gender') != null) {
      gender = Gender.values[preferences.getInt('gender') ?? 0];
    } else {
      gender = Gender.FEMALE;
    }

    //final String username = preferences.getString('username');
    //final isEmployed = preferences.getBool('isEmployed');
    //final gender = Gender.values[preferences.getInt('gender') ?? 0];
/*
    final programmingLanguagesIndicies =
    preferences.getStringList('programmingLanguages');

    final programmingLanguages = programmingLanguagesIndicies!
        .map(
            (stringIndex) => ProgrammingLanguage.values[int.parse(stringIndex)])
        .toSet();
*/
    return Settings(
        username: username,
        gender: gender,
        //programmingLanguages: programmingLanguages,
        isEmployed: isEmployed);
  }
}