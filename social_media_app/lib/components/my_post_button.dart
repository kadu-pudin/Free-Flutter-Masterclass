import 'package:flutter/material.dart';

class MyPostButton extends StatelessWidget {
  final void Function()? onTap;
  const MyPostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(left: 10),
        child: Icon(
          Icons.done,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
