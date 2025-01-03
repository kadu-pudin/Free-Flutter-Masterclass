import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_apps/components/mydrawer.dart';
import 'package:note_apps/components/note_tile.dart';
import 'package:note_apps/models/note.dart';
import 'package:note_apps/models/note_database.dart';
import 'package:note_apps/pages/create_note_page.dart';
import 'package:note_apps/themes/theme_provider.dart';
import 'package:note_apps/themes/themes.dart';
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
        leadingWidth: 70,
        toolbarHeight: 80,
        title: Text('NOTES', style: GoogleFonts.dmSerifText(fontSize: 30)),
        centerTitle: true,
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        child: FloatingActionButton(
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
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: (context, index) {
            final note = currentNotes[index];
            return NoteTile(note: note);
          }),
    );
  }
}
