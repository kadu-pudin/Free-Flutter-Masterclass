import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // pegar as notações
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // criar
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  // ler
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  // atualizar
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // deletar
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
