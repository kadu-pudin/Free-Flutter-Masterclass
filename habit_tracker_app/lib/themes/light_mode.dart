import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.white,
        tertiary: Colors.grey.shade500,
        inversePrimary: Colors.grey.shade800),
    outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black))));
