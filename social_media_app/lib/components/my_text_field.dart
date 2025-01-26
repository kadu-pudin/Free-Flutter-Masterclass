import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String type;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.type,
      required this.controller});

  int getMaxLength() {
    if (type == 'password') {
      return 16;
    } else if (type == 'username') {
      return 15;
    } else {
      return 30;
    }
  }

  Icon getIcon() {
    if (type == 'password') {
      return Icon(Icons.lock);
    } else if (type == 'username') {
      return Icon(Icons.person);
    } else {
      return Icon(Icons.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: type == 'password' ? true : false,
      obscuringCharacter: '*',
      maxLength: getMaxLength(),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold),
        prefixIcon: getIcon(),
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
            )),
      ),
    );
  }
}
