import 'package:flutter/material.dart';
import 'package:onboarding_drawer_save_prefs/utils/preferences_service.dart';
import 'package:onboarding_drawer_save_prefs/utils/user_preferences.dart';
import 'home_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<SettingsPage> {
  var _isOnboardingDone = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final bool? statusOnboarding = await UserSimplePreferences.isOnboardingDone();
    setState(() {
      _isOnboardingDone = statusOnboarding!;
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

            TextButton(onPressed: _saveSettings, child: Text('Save Settings'))
          ],
        ),
      ),
    );
  }

  void _saveSettings() async {
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
