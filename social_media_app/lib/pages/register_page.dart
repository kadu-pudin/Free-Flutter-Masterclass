import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_error_message.dart';
import 'package:social_media_app/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool errorBool = false;
  String errorMessage = '';

  void registerUser(BuildContext context) async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    // if passwords match
    if (pwController.text == confirmPwController.text) {
      // register
      try {
        UserCredential? userCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: pwController.text,
        );
        if (context.mounted) Navigator.of(context).pop();
        createUserDocument(userCredential);
      } on FirebaseAuthException {
        if (context.mounted) Navigator.pop(context);
        setState(() {
          errorMessage = 'Um erro aconteceu';
          errorBool = true;
        });
      }
    } else {
      Navigator.pop(context);
      setState(() {
        errorMessage = 'As senhas não correspondem';
        errorBool = true;
      });
    }
  }

  Future<void> createUserDocument (UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MonkeySocial
                Text('🐵social',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2,
                      fontSize: 75,
                    )),
                SizedBox(height: 10),
                Text('Crie sua senha ainda hoje!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary)),
                SizedBox(height: 20),

                MyTextField(
                  hintText: 'Nome',
                  type: 'username',
                  controller: usernameController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: 'Email',
                  type: 'email',
                  controller: emailController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: 'Senha',
                  type: 'password',
                  controller: pwController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: 'Confirmar senha',
                  type: 'password',
                  controller: confirmPwController,
                ),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: [
                      Visibility(
                        visible: errorBool,
                        child: MyErrorMessage(
                          errorMessage: errorMessage,
                          type: 'register',
                        ),
                      ),
                    ],
                  ),
                ),

                // login button
                MyButton(
                  text: 'Registrar',
                  onTap: () => registerUser(context),
                ),
                // register button
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text('Já é um macaco?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary)),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Entrar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
