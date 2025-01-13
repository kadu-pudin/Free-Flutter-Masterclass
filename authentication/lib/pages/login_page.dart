import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_square_tile.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool errorSigningIn = false;

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException {
      Navigator.pop(context);

      setState(() {
        errorSigningIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Icon(
                  Icons.shopping_bag,
                  size: 100,
                ),
              ),
              // welcome back!
              Text(
                'Welcome back, You\'ve been missed!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),

              SizedBox(
                height: 25,
              ),

              // login

              MyTextfield(
                hintText: 'email',
                obscureText: false,
                controller: emailController,
              ),

              SizedBox(
                height: 15,
              ),

              MyTextfield(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),

              // esqueceu a senha?
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: errorSigningIn,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(30, 244, 67, 54)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text('Wrong email or password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: const Color.fromARGB(150, 244, 67, 54))),
                      ),
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // botão de login
              MyButton(
                onTap: signUserIn,
              ),
              // mais opções de login

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or continue with',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary)),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.secondary,
                        thickness: 0.5,
                      ),
                    )
                  ],
                ),
              ),
              // register now
              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MySquareTile(
                    imagePath: 'lib/images/google.png',
                    height: 56,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  MySquareTile(
                    imagePath: 'lib/images/apple.png',
                    height: 68,
                  ),
                ],
              ),

              SizedBox(
                height: 70,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary)),
                  SizedBox(
                    width: 6,
                  ),
                  Text('Register Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
