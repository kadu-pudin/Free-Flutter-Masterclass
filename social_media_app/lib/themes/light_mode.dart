import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade200,
        primary: Colors.grey,
        secondary: Colors.white,
        tertiary: const Color.fromARGB(255, 186, 138, 87),
        inversePrimary: Colors.grey.shade900),
    textTheme: ThemeData.light()
        .textTheme
        .apply(bodyColor: Colors.grey.shade800, displayColor: Colors.black));
