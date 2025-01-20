import 'package:chat_app/services/authentication/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_error_msg.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool error = false;

  String errorMessage = '';

  void register() async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await AuthService().signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        if (e.toString() == 'Exception: email-already-in-use') {
          setState(() {
            error = true;
            errorMessage = 'E-mail já em uso.';
          });
        } else if (e.toString() == 'Exception: invalid-email') {
          setState(() {
            error = true;
            errorMessage = 'E-mail inválido.';
          });
        } else if (e.toString() == 'Exception: weak-password') {
          setState(() {
            error = true;
            errorMessage = 'A senha deve ter pelo menos 6 caracteres.';
          });
        } else if (e.toString() == 'Exception: channel-error') {
          setState(() {
            error = true;
            errorMessage =
                'Por favor, preencha todos os campos para continuar.';
          });
        } else {
          setState(() {
            error = true;
            errorMessage = e.toString();
          });
        }
      }
    } else {
      setState(() {
        error = true;
        errorMessage = 'Senhas diferentes.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    fontSize: 50,
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
                SizedBox(height: 10),
                MyTextField(
                  hintText: 'Confirmar senha',
                  type: 'senha',
                  controller: confirmPasswordController,
                ),
                MyErrorMsg(message: errorMessage, visible: error),
                Visibility(visible: !error, child: SizedBox(height: 30)),
                // botão
                MyButton(
                  text: 'Registrar',
                  onTap: register,
                ),
                SizedBox(height: 20),
                // register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Já é um macaco?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Entrar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
