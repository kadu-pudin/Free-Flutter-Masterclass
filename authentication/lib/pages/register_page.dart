import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_square_tile.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool errorWithPasswords = false;
  String errorText = '';

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        setState(() {
          errorText = 'Passwords don\'t match!';
          errorWithPasswords = true;
        });
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'email-already-in-use') {
        setState(() {
          errorText = 'Email already in use!';
          errorWithPasswords = true;
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          errorText = 'Weak password!';
          errorWithPasswords = true;
        });
      } else {
        setState(() {
          errorText = 'Invalid email or password!';
          errorWithPasswords = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: Icon(
                    Icons.shopping_bag,
                    size: 50,
                  ),
                ),
                // welcome back!
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),

                SizedBox(
                  height: 25,
                ),

                // login

                MyTextfield(
                  hintText: 'Email',
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

                SizedBox(
                  height: 15,
                ),

                MyTextfield(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: confirmPasswordController,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: errorWithPasswords,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(30, 244, 67, 54)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(errorText,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color:
                                      const Color.fromARGB(150, 244, 67, 54))),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // botão de login
                MyButton(
                  text: 'Register Now',
                  onTap: signUserUp,
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
                                color:
                                    Theme.of(context).colorScheme.secondary)),
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
                      onTap: () => AuthServices().signInWithGoogle(),
                      imagePath: 'lib/images/google.png',
                      height: 56,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    MySquareTile(
                      onTap: () {},
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
                    Text('Already have an account?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary)),
                    SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Login now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          )),
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
