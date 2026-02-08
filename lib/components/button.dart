import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  String text;
  CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: Size(double.infinity, 70),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
