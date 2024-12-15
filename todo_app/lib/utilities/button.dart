import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.black54,
      highlightColor: Colors.black54,
      color: Colors.blueGrey[900],
      elevation: 0.0,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
      onPressed: onPressed,
    );
  }
}
