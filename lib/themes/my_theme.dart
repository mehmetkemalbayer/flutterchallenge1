import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            textTheme: TextTheme(
              headline3: TextStyle(color: Colors.black),
              subtitle1: TextStyle(color: Colors.black),
              subtitle2: TextStyle(color: Colors.black),
              bodyText1: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.black),
            ));
      case ThemeType.Dark:
        return ThemeData(
            primaryColor: Colors.grey[900],
            appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
            textTheme: TextTheme(
              headline3: TextStyle(color: Colors.white),
              subtitle1: TextStyle(color: Colors.white),
              subtitle2: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            ));
      case ThemeType.Pride:
        return ThemeData(
            primaryColor: Colors.purple[900],
            appBarTheme: AppBarTheme(backgroundColor: Colors.purple[900]),
            textTheme: TextTheme(
              headline3: TextStyle(color: Colors.red),
              subtitle1: TextStyle(color: Colors.yellow),
              subtitle2: TextStyle(color: Colors.green),
              bodyText1: TextStyle(color: Colors.blueAccent),
              bodyText2: TextStyle(color: Colors.purple),
            ));
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Pride,
}
