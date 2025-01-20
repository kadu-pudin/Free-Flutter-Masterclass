import 'package:chat_app/services/authentication/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_error_msg.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool error = false;
  String errorMessage = '';

  void login() async {
    try {
      await AuthService().signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      if (e.toString() == 'Exception: invalid-email') {
        setState(() {
          error = true;
          errorMessage = 'E-mail inválido.';
        });
      } else if (e.toString() == 'Exception: invalid-credential') {
        setState(() {
          error = true;
          errorMessage = 'E-mail ou senha incorretos.';
        });
      } else if (e.toString() == 'Exception: channel-error') {
        setState(() {
          error = true;
          errorMessage = 'Por favor, preencha todos os campos para continuar.';
        });
      } else {
        setState(() {
          error = true;
          errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🐵chat',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -2,
                  ),
                ),
                SizedBox(height: 20),
                // mensagem
                Text('Converse com seus macacos-amigos!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    )),
                SizedBox(height: 20),
                // textfields
                MyTextField(
                  hintText: 'Email',
                  type: 'email',
                  controller: emailController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: 'Senha',
                  type: 'senha',
                  controller: passwordController,
                ),
                MyErrorMsg(
                  visible: error,
                  message: errorMessage,
                ),
                Visibility(visible: !error, child: SizedBox(height: 30)),
                // botão
                MyButton(
                  text: 'Entrar',
                  onTap: login,
                ),
                SizedBox(height: 20),
                // register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ainda não é um macaco?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Registrar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
