import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // errors
          else if (snapshot.hasError) {
            return Center(
              child: const Text('Erro',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            );
          }
          // data
          else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data();

            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                spacing: 20,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, bottom: 20),
                    child: Row(
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
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 125,
                        width: 125,
                        child: Center(
                          child: Text(
                            '🐵',
                            style: TextStyle(
                              fontSize: 75,
                            ),
                          ),
                        ),
                      ),
                      Text(user!['username'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32)),
                      Text(user['email'],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16)),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: const Text('Sem informação',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            );
          }
        },
      ),
    );
  }
}
