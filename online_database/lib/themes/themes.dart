import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.white,
        tertiary: Colors.grey.shade600,
        inversePrimary: Colors.grey.shade800));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.grey.shade400,
        selectionColor: Colors.black45,
        selectionHandleColor: Colors.black45),
    colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade900,
        primary: const Color.fromARGB(255, 53, 53, 53),
        secondary: const Color.fromARGB(255, 68, 68, 68),
        tertiary: const Color.fromARGB(255, 99, 99, 99),
        inversePrimary: Colors.grey.shade200));
