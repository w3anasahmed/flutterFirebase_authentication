import 'package:authentication/components/button.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:authentication/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //void sign
  void userSignUp() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text('pass and confirm pass are not same')),
        );
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.code.toString())),
      );
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
              SizedBox(height: 50),
              //logo
              Icon(Icons.lock, size: 95),
              SizedBox(height: 40),

              //welcome back , you've been missed!
              Text(
                'lets create an account!',
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

              SizedBox(height: 20),

              CustomTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              SizedBox(height: 10),

              //forgot password?
              SizedBox(height: 25),
              //sign in button
              CustomButton(onPressed: () => userSignUp(), text: 'Register Now'),
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
                  SquareTile(imagePath: "images/google.png"),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'images/apple.png'),
                ],
              ),
              SizedBox(height: 50),
              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now',
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
