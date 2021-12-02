# onboarding_drawer_save_prefs

Create an onboarding page, use a drawer navigation and save preferences

```plaintext
dependencies:

for onboarding:
(introduction_screen: ^1.0.9)
introduction_screen: ^2.1.0

plus some images in assets:
assets:
  - assets/
  
  
for shared preferences - before you run the app call WidgetsFlutterBinding.ensureInitialized
and UserPreferences.init:

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MyApp());
}

to store app data
shared_preferences: ^2.0.9

to show linkable texts
url_launcher: ^6.0.17

```

add in AndroidManifest.xml:
```plaintext
    <queries>
        <!-- If your app opens https URLs -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
    </queries>
```



```plaintext
help given by

Onboarding:
https://www.youtube.com/watch?v=CQlA2p--oEg
https://github.com/JohannesMilke/onboarding_screen_example

Sidebar Menu & Navigation Drawer With Routing
https://www.youtube.com/watch?v=ts9n211n8ZU
https://github.com/JohannesMilke/navigation_drawer_example

Shared preferences:
https://www.youtube.com/watch?v=szOllHT1S7Y
https://github.com/JohannesMilke/shared_preferences_simple_example

```

add in iOS/Runner/Info.plist:
```plaintext
Add any URL schemes passed to canLaunch as LSApplicationQueriesSchemes entries in your Info.plist file.
Example:
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>https</string>
  <string>http</string>
</array>
```


```plaintext

```

```plaintext

```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
