import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.secondary),
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.chevron_left,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Users').snapshots(),
                builder: (context, snapshot) {
                  // loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // errors
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Algo deu errado.',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    );
                  }

                  if (snapshot.data == null) {
                    return Center(
                      child: Text('Sem informação.',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    );
                  }
                  // data
                  final users = snapshot.data!.docs;

                  return ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(user['username'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          subtitle: Text(user['email'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
