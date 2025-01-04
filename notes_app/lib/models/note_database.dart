import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDataBase extends ChangeNotifier {
  static late Isar isar;

  // iniciar database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  // Lista de Notas
  List<Note> currentNotes = [];

  // Criar
  Future<void> addNote(String titleFromUser, String textFromUser) async {
    final newNote = Note();
    newNote.text = textFromUser;
    newNote.title = titleFromUser;
    await isar.writeTxn(() => isar.notes.put(newNote));
    fetchNotes();
  }

  // Ler
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  // Atualizar
  Future<void> updateNote(Id id, String newTitle, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      existingNote.title = newTitle;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // Deletar
  Future<void> deleteNote(Id id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
