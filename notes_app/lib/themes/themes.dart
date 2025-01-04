import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.white,
        inversePrimary: Colors.grey.shade700),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black54,
      selectionHandleColor: Colors.black,
    ));

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        surface: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700,
        inversePrimary: Colors.grey.shade400),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Color.fromARGB(137, 14, 9, 9),
      selectionHandleColor: Colors.white,
    ));
