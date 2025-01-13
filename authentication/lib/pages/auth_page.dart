import 'package:authentication/pages/home_page.dart';
import 'package:authentication/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        // se estiver conectado
        if (snapshot.hasData) {
          return HomePage();
        }

        // se NÃO estiver conectado
        else {
          return LoginPage();
        }
      },),
    );
  }
}