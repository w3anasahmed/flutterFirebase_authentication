import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final hintText;
  final bool obscureText;
  TextEditingController controller;

  CustomTextField({
    super.key,
    this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),

          fillColor: Colors.grey.shade200,
          filled: true,
        ),

        controller: controller,
        style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
        obscureText: obscureText,

        obscuringCharacter: '•',
      ),
    );
  }
}
