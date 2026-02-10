import 'package:authentication/components/button.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:authentication/components/textfield.dart';
import 'package:authentication/screens/register_page.dart';
import 'package:authentication/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  void Function()? onTapFunction;
  LoginPage({super.key, required this.onTapFunction});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  //void sign
  void userSignIn() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-email') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('Wrong email')),
        );
      } else if (e.code == 'invalid-credential') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('Wrong password')),
        );
      } else {
        print(e.code);
      }
    }

    //to stop the circular progress bar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              //logo
              Icon(Icons.lock, size: 95),
              SizedBox(height: 50),

              //welcome back , you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              SizedBox(height: 25),
              //user textfield
              CustomTextField(
                controller: emailController,
                hintText: 'Username',
                obscureText: false,
              ),
              SizedBox(height: 20),
              //password textfield
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 10),
              //forgot password?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Text(
                      'forgot password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              //sign in button
              CustomButton(onPressed: () => userSignIn(), text: 'Sign In'),
              SizedBox(height: 50),
              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              //google + apple
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: "images/google.png",
                    onTap: () => AuthServices().signInWithGoogle(),
                  ),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'images/apple.png', onTap: () {}),
                ],
              ),
              SizedBox(height: 50),
              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: widget.onTapFunction,
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
