import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  String imagePath;
  SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 75,
      child: Image.asset(imagePath),
    );
  }
}
