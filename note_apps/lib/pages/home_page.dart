import 'package:flutter/material.dart';
import 'package:note_apps/components/note_tile.dart';
import 'package:note_apps/models/note.dart';
import 'package:note_apps/models/note_database.dart';
import 'package:note_apps/pages/create_note_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  void createNote() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateNotePage(
            text: textController.text,
            title: titleController.text,
          ),
        ));
  }

  void readNotes() {
    context.read<NoteDataBase>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    final noteDataBase = context.watch<NoteDataBase>();

    List<Note> currentNotes = noteDataBase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        title: Text('NOTES', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: (context, index) {
            final note = currentNotes[index];
            return NoteTile(note: note);
          }),
    );
  }
}
