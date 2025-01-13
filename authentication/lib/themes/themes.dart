import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.white,
      tertiary: Colors.grey.shade600,
      inversePrimary: Colors.grey.shade800,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey.shade600,
      selectionColor: Colors.black45,
      selectionHandleColor: Colors.grey.shade600,
    ),
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      tertiary: Colors.grey.shade600,
      inversePrimary: Colors.grey.shade300,
    ));
