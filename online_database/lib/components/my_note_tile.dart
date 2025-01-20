import 'package:flutter/material.dart';
import 'package:online_database/services/firestore.dart';

class MyNoteTile extends StatelessWidget {
  final String noteText;
  final Function openNoteBox;
  final String docID;
  MyNoteTile(
      {super.key,
      required this.noteText,
      required this.openNoteBox,
      required this.docID});

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 15, right: 25, left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                noteText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  onPressed: () => openNoteBox(docID: docID),
                ),
                IconButton(
                  icon: Icon(Icons.delete,
                      color: Theme.of(context).colorScheme.tertiary),
                  onPressed: () => firestoreService.deleteNote(docID),
                ),
              ],
            ),
          ],
        ));
  }
}
