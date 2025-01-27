import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_drawer.dart';
import 'package:social_media_app/components/my_list_tile.dart';
import 'package:social_media_app/components/my_post_button.dart';
import 'package:social_media_app/components/my_text_field.dart';
import 'package:social_media_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirestoreDatabase database = FirestoreDatabase();

  final TextEditingController newPostController = TextEditingController();

  void postMessage() {
    if (newPostController.text.isNotEmpty) {
      database.addPost(newPostController.text);
    }
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'P O S T S',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hintText: 'Poste algo!',
                    type: 'post',
                    controller: newPostController,
                  ),
                ),
                MyPostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),

          // P O S T S
          StreamBuilder(
            stream: database.getPosts(),
            builder: (context, snapshot) {
              // loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              // get posts
              final posts = snapshot.data!.docs;

              // no data
              if (snapshot.data == null || posts.isEmpty) {
                return Center(
                  child: Text('Sem posts.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                );
              }

              return Expanded(
                  child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  String message = post['PostMessage'];
                  String userEmail = post['UserEmail'];
                  Timestamp timeStamp = post['TimeStamp'];

                  return MyListTile(
                    title: message,
                    subtitle: userEmail,
                    type: 'post',
                  );
                },
              ));
            },
          )
        ]),
      ),
    );
  }
}
