import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_error_message.dart';
import 'package:social_media_app/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool errorBool = false;
  String errorMessage = '';

  void forgotPassword() {}

  void login() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: pwController.text,
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException {
      Navigator.pop(context);
      setState(() {
        errorMessage = 'Email ou senha inválidos';
        errorBool = true;
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
                Text('Poste e reaja a macaco-posts!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary)),
                SizedBox(height: 20),
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

                // forgot password?
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: errorBool,
                        child: MyErrorMessage(
                            errorMessage: errorMessage, type: 'login'),
                      ),
                      GestureDetector(
                        onTap: forgotPassword,
                        child: Text('Esqueceu a senha?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      )
                    ],
                  ),
                ),

                // login button
                MyButton(
                  text: 'Entrar',
                  onTap: login,
                ),
                // register button
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text('Ainda não é um macaco?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary)),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Registrar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary,
                            ))),
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
