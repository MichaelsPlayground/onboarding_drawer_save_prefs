import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:onboarding_drawer_save_prefs/main.dart';
import 'package:url_launcher/link.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('About this app and licenses'),
          centerTitle: true,
          //backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'This app is demonstrating some onboarding pages, a drawer navigation, the storage of shared preferences and an "about app" screen with license information.',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        // own license
                        LicenseRegistry.addLicense(() async* {
                          yield LicenseEntryWithLineBreaks(
                            ['FlutterCrypto Onboarding+'],
                            'The program is in Public Domain.',
                          );
                        });
                        // show license dialog
                        showAboutDialog(
                          context: context,
                          applicationName: MyApp.title,
                          applicationVersion: '1.0.0',
                          applicationIcon: Image.asset(
                              'assets/flutter_crypto_raw2.png',
                              height: 86,
                              width: 86),
                          applicationLegalese:
                              'This program is intended to be in the Public Domain',
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                  'Die App demonstriert die Verschlüsselung mit'
                                  ' dem AES Algorithmus in den Modi CBC und GCM.'
                                  '\nDer Schlüssel wird mit PBKDF2 aus einem Passwort erzeugt.'),
                            ),
                          ],
                        );
                      },
                      child: Text('about this app and licenses in use'),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                // clickable hyperlink as Text
                Link(
                  target: LinkTarget.blank, // new browser, not in app
                  // don't forget to add queries in AndroidManifest.xml
                  // and url scheme in Info.plist file
                  //uri: Uri.parse('https://flutter.dev'),
                  uri: Uri.parse(
                      'http://fluttercrypto.bplaced.net/'),
                  builder: (context, followLink) => GestureDetector(
                    onTap: followLink,
                    child: linkWidget(),
                  ),
                ),

                // link to pub.dev
                SizedBox(height: 10),
                // clickable hyperlink as Text
                Link(
                  target: LinkTarget.blank, // new browser, not in app
                  // don't forget to add queries in AndroidManifest.xml
                  // and url scheme in Info.plist file
                  uri: Uri.parse('https://pub.dev/packages/webcrypto'),
                  builder: (context, followLink) => GestureDetector(
                    onTap: followLink,
                    child: libraryLinkWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  BoxDecoration linkBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: Colors.grey,
      ),
      borderRadius:
          BorderRadius.all(Radius.circular(10.0) // <--- border radius here
              ),
    );
  }

  Widget linkWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: linkBoxDecoration(), // <--- BoxDecoration here
      child: Text(
        //'Beschreibung des Programms: http://fluttercrypto.bplaced.net/aes-playground-wc',
        'Program description: http://fluttercrypto.bplaced.net/',
        style: TextStyle(
          fontSize: 18,
          color: Colors.blue,
          //decoration: TextDecoration.underline,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget libraryLinkWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: linkBoxDecoration(), // <--- BoxDecoration here
      child: Text(
        //'verwendete Kryptographie Bibliothek:'
        'Used crypto library:'
        '\nwebcrypto Version 0.5.2'
        '\nhttps://pub.dev/packages/webcrypto',
        style: TextStyle(
          fontSize: 18,
          color: Colors.blue,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
