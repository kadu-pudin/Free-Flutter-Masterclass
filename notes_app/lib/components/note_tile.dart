import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/pages/update_note_page.dart';
import 'package:provider/provider.dart';

class NoteTile extends StatefulWidget {
  final Note note;
  const NoteTile({super.key, required this.note});

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  void deleteNote(int id) {
    context.read<NoteDataBase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UpdateNotePage(
                    note: widget.note,
                  ))),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(bottom: 20, left: 25, right: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.note.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(
                    widget.note.text.trim().length > 26
                        ? '${widget.note.text.trim().substring(0, 26)}...'
                        : '${widget.note.text.trim()}...',
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12)),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onPressed: () => deleteNote(widget.note.id),
            ),
          ],
        ),
      ),
    );
  }
}
