import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;
  final String? type;
  final TextEditingController controller;
  const MyTextField ({
    super.key,
    required this.controller,
    required this.hintText,
    this.focusNode,
    this.type,
  });

  int maxTextLength() {
    if (type == 'email') {
      return 30;
    } else if (type == 'senha') {
      return 16;
    } else {
      return 500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary),
      obscureText: (type == 'senha') ? true : false,
      obscuringCharacter: "*",
      maxLength: maxTextLength(),
      decoration: InputDecoration(
          prefixIcon: Icon((type == 'senha') ? Icons.lock : Icons.email),
          hintText: hintText,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          counterText: (type == null) ? null : '',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ))),
    );
  }
}
