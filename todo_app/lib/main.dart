import 'package:flutter/material.dart';
import 'package:todo_app/pages/homepage.dart';

void main() => runApp(MainApp());

// lightColor = Colors.blueGrey | darkColor = Colors.blueGrey[900]

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData());
  }
}
