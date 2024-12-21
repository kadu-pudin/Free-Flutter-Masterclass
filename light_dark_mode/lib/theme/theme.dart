import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        surface: Colors.grey.shade400,
        primary: Colors.grey.shade300,
        secondary: Colors.grey.shade200));

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        surface: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700));
