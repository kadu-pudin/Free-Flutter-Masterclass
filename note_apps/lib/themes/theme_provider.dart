import 'package:flutter/material.dart';
import 'package:note_apps/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  late bool isLightMode = brightness == Brightness.light;

  late ThemeData _themeData = isLightMode ?lightMode : darkMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
