import 'package:flutter/material.dart';

class MyErrorMessage extends StatelessWidget {
  final String errorMessage;
  final String type;
  const MyErrorMessage({
    super.key,
    required this.type,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      constraints: type == 'login' ? BoxConstraints(maxWidth: 200) : null,
      decoration: BoxDecoration(
          color: const Color.fromARGB(60, 244, 67, 54),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(2))),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        '* $errorMessage',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(200, 244, 67, 54),
          height: 1.25,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
