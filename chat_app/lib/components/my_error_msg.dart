import 'package:flutter/material.dart';

class MyErrorMsg extends StatelessWidget {
  final bool visible;
  final String message;
  const MyErrorMsg({
    super.key,
    required this.message,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(60, 244, 67, 54)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: EdgeInsets.only(top: 10, bottom: 15),
              child: Text('* $message',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(200, 244, 67, 54))),
            ),
          ],
        ));
  }
}
