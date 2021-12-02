import 'package:flutter/material.dart';
import 'package:onboarding_drawer_save_prefs/page/home_page.dart';
import 'package:onboarding_drawer_save_prefs/page/onboarding_page.dart';
import 'package:onboarding_drawer_save_prefs/utils/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // important for shared references
  await UserSimplePreferences.init();

  bool? status = await UserSimplePreferences.isOnboardingDone();
  //runApp(MyApp(status));

  runApp(
    MaterialApp(home: status == true ? MyApp() : OnBoardingPage()),
  );

}


class MyApp extends StatelessWidget {
  static final String title = 'Onboarding+ Example';

  //MyApp(bool? status2);
  //get status => false;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        //home: OnBoardingPage(),
      home: HomePage(),
      );
}
