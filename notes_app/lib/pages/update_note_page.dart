import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

class UpdateNotePage extends StatefulWidget {
  final Note note;
  const UpdateNotePage({super.key, required this.note});

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  final titleController = TextEditingController();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.note.title;
    textController.text = widget.note.text;

    return Scaffold(
        appBar: AppBar(
          title: Text('Update Note',
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 32,
            ),
            onPressed: () {
              context.read<NoteDataBase>().updateNote(
                    widget.note.id,
                    titleController.text,
                    textController.text,
                  );
              textController.clear();
              titleController.clear();
              Navigator.pop(context);
            },
          ),
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
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  cursorColor: Theme.of(context).colorScheme.inversePrimary,
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
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: textController,
                    maxLines: null,
                    expands: true,
                    cursorColor: Theme.of(context).colorScheme.inversePrimary,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
