import 'package:flutter/material.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

class CreateNotePage extends StatefulWidget {
  final String? text;
  final String? title;
  const CreateNotePage({
    super.key,
    this.title,
    this.text,
  });

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final titleController = TextEditingController();
  final textController = TextEditingController();

  void createNote(String title, String text) {
    context.read<NoteDataBase>().addNote(
          titleController.text,
          textController.text,
        );
    textController.clear();
    titleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Create Note', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 32,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (titleController.text != '') {
                  createNote(titleController.text, textController.text);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    margin: EdgeInsets.all(10),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      "Título vazio.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    backgroundColor: Colors.black87,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ));
                }
              },
              icon: Icon(
                Icons.check,
                size: 32,
              )),
          SizedBox(width: 12)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 40, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                style: TextStyle(fontWeight: FontWeight.bold),
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text('Text',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  controller: textController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
