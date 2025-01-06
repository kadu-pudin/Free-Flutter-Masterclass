import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
        surface: const Color.fromARGB(255, 27, 26, 31),
        primary: const Color.fromARGB(255, 39, 38, 43),
        secondary: const Color.fromARGB(255, 51, 50, 55),
        tertiary: const Color.fromARGB(255, 63, 62, 67),
        inversePrimary: Colors.grey.shade200),
    outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black))));
