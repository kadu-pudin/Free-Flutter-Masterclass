import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade800,
    tertiary:const Color.fromARGB(255, 186, 138, 87),
    inversePrimary: Colors.grey.shade200
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey.shade200,
    displayColor: Colors.white
  )
);