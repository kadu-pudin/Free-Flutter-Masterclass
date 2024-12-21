import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
  brightness: Brightness.light,
  surface: Colors.blueGrey.shade400,
  surfaceBright: Colors.blueGrey.shade500,
  primary: Colors.blueGrey.shade300,
  secondary: Colors.blueGrey.shade700,
));

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
  brightness: Brightness.dark,
  surface: Colors.blueGrey.shade900,
  surfaceBright: Colors.blueGrey.shade600,
  primary: Colors.blueGrey.shade800,
  secondary: Colors.blueGrey.shade300,
));
