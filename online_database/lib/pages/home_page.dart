import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_database/components/my_alert_dialog.dart';
import 'package:online_database/components/my_note_tile.dart';
import 'package:online_database/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();

  void openNoteBox({String? docID}) {
    showDialog(
        context: context, builder: (context) => MyAlertDialog(docID: docID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTES', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.add,
          size: 32,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = noteList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return MyNoteTile(
                  noteText: noteText,
                  openNoteBox: openNoteBox,
                  docID: docID,
                );
              },
            );
          } else {
            return Center(
              child: Text('No notes...',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.tertiary)),
            );
          }
        },
      ),
    );
  }
}
