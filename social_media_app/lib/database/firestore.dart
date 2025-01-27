import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
  - user email
  - message
  - timestamp
*/

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

// current user
User? user = auth.currentUser;

class FirestoreDatabase {
  // get collection of posts
  final CollectionReference posts = firestore.collection('Posts');
  
  // add posts
  Future<void> addPost(String message) async {
    await posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  // read posts
  Stream<QuerySnapshot> getPosts() {
    final postsStream = firestore
        .collection('Posts')
        .orderBy('TimeStamp', descending: true)
        .snapshots();
    return postsStream;
  }
}
