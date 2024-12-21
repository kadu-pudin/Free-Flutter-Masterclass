import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  final void Function()? onTap;
  const MyButton2({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 14),
        child: Text(
          '😢  Chorei',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
