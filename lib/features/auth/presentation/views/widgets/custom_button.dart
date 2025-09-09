import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(double.infinity, 60), // يخلي الزر بعرض الشاشة
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              image,
              width: 40,
            ),
          ),
          Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
