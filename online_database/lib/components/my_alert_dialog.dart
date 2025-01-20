import 'package:flutter/material.dart';
import 'package:online_database/services/firestore.dart';

class MyAlertDialog extends StatelessWidget {
  final String? docID;
  MyAlertDialog({super.key, required this.docID});

  final TextEditingController textController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: TextField(
        controller: textController,
        showCursor: true,
        maxLength: 20,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 2,
                ))),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            if (textController.text != '') {
              if (docID == null) {
                firestoreService.addNote(textController.text);
              } else {
                firestoreService.updateNote(docID!, textController.text);
              }
            }
            textController.clear();
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.primary,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            'save',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        )
      ],
    );
  }
}
