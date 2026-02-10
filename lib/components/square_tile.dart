import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  String imagePath;
  void Function()? onTap;

  SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 75,
        child: Image.asset(imagePath),
      ),
    );
  }
}
