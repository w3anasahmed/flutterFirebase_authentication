import 'package:authentication/screens/login_page.dart';
import 'package:authentication/screens/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;
  void trogglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTapFunction: trogglePages);
    } else {
      return RegisterPage(onTap: trogglePages);
    }
  }
}
