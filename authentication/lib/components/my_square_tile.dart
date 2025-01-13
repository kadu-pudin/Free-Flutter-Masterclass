import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String imagePath;
  final double height;
  const MySquareTile(
      {super.key, required this.imagePath, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(color: Theme.of(context).colorScheme.secondary)),
        height: 75,
        width: 75,
        padding: EdgeInsets.all(15),
        child: Image.asset(
          imagePath,
          height: height,
          color: Theme.of(context).colorScheme.inversePrimary,
        ));
  }
}
