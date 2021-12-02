import 'package:flutter/material.dart';
import 'package:onboarding_drawer_save_prefs/models/setting_models.dart';
import 'package:onboarding_drawer_save_prefs/utils/preferences_service.dart';
import 'package:onboarding_drawer_save_prefs/utils/user_preferences.dart';

import 'home_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<SettingsPage> {
  final _preferencesService = PreferencesService();

  var _isOnboardingDone = false;
  final _usernameController = TextEditingController();
  var _selectedGender = Gender.FEMALE;
  //var _selectedLanguages = Set<ProgrammingLanguage>();
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final Settings? settings = await _preferencesService.getSettings();
    final bool? statusOnboarding = await UserSimplePreferences.isOnboardingDone();
    setState(() {
      _isOnboardingDone = statusOnboarding!;
      _usernameController.text = settings!.username;
      _selectedGender = settings.gender;
      //_selectedLanguages = (settings.programmingLanguages != null ? settings.programmingLanguages : null);
      _isEmployed = (settings.isEmployed != null ? settings.isEmployed : false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile(
                title: Text('Onboarding is done'),
                value: _isOnboardingDone,
                onChanged: (newValue) =>
                    setState(() => _isOnboardingDone = newValue)),
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            RadioListTile(
                title: Text('Female'),
                value: Gender.FEMALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue as Gender)),
            RadioListTile(
                title: Text('Male'),
                value: Gender.MALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue as Gender)),
            RadioListTile(
                title: Text('Other'),
                value: Gender.OTHER,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue as Gender)),
/*
            CheckboxListTile(
                title: Text('Dart'),
                value: _selectedLanguages.contains(ProgrammingLanguage.DART),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguage.DART)
                        ? _selectedLanguages.remove(ProgrammingLanguage.DART)
                        : _selectedLanguages.add(ProgrammingLanguage.DART);
                  });
                }),
            CheckboxListTile(
                title: Text('JavaScript'),
                value:
                _selectedLanguages.contains(ProgrammingLanguage.JAVASCRIPT),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguage.JAVASCRIPT)
                        ? _selectedLanguages
                        .remove(ProgrammingLanguage.JAVASCRIPT)
                        : _selectedLanguages
                        .add(ProgrammingLanguage.JAVASCRIPT);
                  });
                }),
            CheckboxListTile(
                title: Text('Kotlin'),
                value: _selectedLanguages.contains(ProgrammingLanguage.KOTLIN),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguage.KOTLIN)
                        ? _selectedLanguages.remove(ProgrammingLanguage.KOTLIN)
                        : _selectedLanguages.add(ProgrammingLanguage.KOTLIN);
                  });
                }),
            CheckboxListTile(
                title: Text('Swift'),
                value: _selectedLanguages.contains(ProgrammingLanguage.SWIFT),
                onChanged: (_) {
                  setState(() {
                    _selectedLanguages.contains(ProgrammingLanguage.SWIFT)
                        ? _selectedLanguages.remove(ProgrammingLanguage.SWIFT)
                        : _selectedLanguages.add(ProgrammingLanguage.SWIFT);
                  });
                }),
 */
            SwitchListTile(
                title: Text('Is Employed'),
                value: _isEmployed,
                onChanged: (newValue) =>
                    setState(() => _isEmployed = newValue)),
            TextButton(onPressed: _saveSettings, child: Text('Save Settings'))
          ],
        ),
      ),
    );
  }

  void _saveSettings() async {
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectedGender,
        //programmingLanguages: _selectedLanguages,
        isEmployed: _isEmployed);

    print(newSettings);
    _preferencesService.saveSettings(newSettings);
    if (_isOnboardingDone) {
      await UserSimplePreferences.onboardingDone();
    } else {
      await UserSimplePreferences.onboardingNotDone();
    }
    goToHome(context);
  }

  void goToHome(context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
}

/*
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          centerTitle: true,
          //backgroundColor: Colors.red,
        ),
      );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
*/