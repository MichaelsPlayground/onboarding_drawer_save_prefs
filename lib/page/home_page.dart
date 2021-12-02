import 'package:flutter/material.dart';
import 'package:onboarding_drawer_save_prefs/widget/button_widget.dart';
import 'package:onboarding_drawer_save_prefs/widget/navigation_drawer_widget.dart';

import '../main.dart';
import 'onboarding_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(

    drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HomePage',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                icon: Icons.open_in_new,
                text: 'Go Back',
                onClicked: () => goToOnBoarding(context),
              ),
            ],
          ),
        ),
      );

  void goToOnBoarding(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingPage()),
      );
}
