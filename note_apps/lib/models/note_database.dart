import 'package:isar/isar.dart';
import 'package:note_apps/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDataBase {
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
  Future<void> addNote(String textFromUser) async {
    final newNote = Note()..text = textFromUser;
    await isar.writeTxn(() => isar.notes.put(newNote));
    fetchNotes();
  }

  // Ler
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear;
    currentNotes.addAll(fetchedNotes);
  }

  // Atualizar
  Future<void> updateNote(Id id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
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
