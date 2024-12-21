import 'package:flutter/material.dart';
import 'package:todo_app/utilities/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      content: SizedBox(
        height: 150,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
              cursorColor: Theme.of(context).colorScheme.secondary,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.primary,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                icon: Icon(
                  Icons.draw,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                hintText: 'Create New Task',
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.surfaceBright,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Cancelar', onPressed: onCancel),
                SizedBox(
                  width: 10,
                ),
                MyButton(text: 'Salvar', onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
