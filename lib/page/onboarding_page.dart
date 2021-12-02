import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding_drawer_save_prefs/widget/button_widget.dart';
import 'package:onboarding_drawer_save_prefs/page/home_page.dart';
import 'package:onboarding_drawer_save_prefs/utils/user_preferences.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SafeArea(
        child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Flutter cryptography - encryption',
                body:
                'encryption made easy - use AES in CBC/GCM mode and XChacha20Poly1305 symmetric algorithms'
                    ' or RSA and Elliptic Curve asymmetric encryption algorithms.',
                image: buildImage('assets/encryption_computer.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Digital signatures',
                body:
                'learn how to secure your data by signing them with RSA or Elliptic Curve algorithms.',
                //image: buildImage('assets/readingbook.png'),
                image: buildImage('assets/digital_signature.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Key Exchange',
                body:
                'Perform a secure key exchange with RSA and Elliptic curve algorithms.',
                //image: buildImage('assets/manthumbs.png'),
                image: buildImage('assets/key_exchange.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Visit FlutterCrypto',
                body: 'more information on http://fluttercrypto.bplaced.net',
                footer: ButtonWidget(
                  icon: Icons.open_in_new,
                  text: 'Start cryptography',
                  onClicked: () => goToHome(context),
                ),
                //image: buildImage('assets/learn.png'),
                image: buildImage('assets/flutter_crypto_raw2.png'),
                decoration: getPageDecoration(),
              ),
            ],
            //globalBackgroundColor: Theme.of(context).primaryColor, // be carefull, yout can't read the text buttons
            dotsDecorator: getDotDecoration(),
            showNextButton: true,
            showSkipButton: true,
            skip: Text("Skip"),
            //skipFlex: 0, // both move the buttons to the borders
            //nextFlex: 0,
            next: Icon(Icons.arrow_forward),
            //next: Text("Next"),
            done: Text("Got it "),
            //onChange: (index) => print('Page $index selected'),
            isProgressTap: true,
            // freeze: true, // move forward only with next button
            //animationDuration: 1000, // length of animation for next page
            //isProgress: true,
            onSkip: () => goToHome(context),
            onDone: () async {
              // save in preferences
              await UserSimplePreferences.onboardingDone();
              goToHome(context);
            }
        ),
      );

  void goToHome(context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() =>
      DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(24),
      )

  ,

  );

  PageDecoration getPageDecoration() =>
      PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
