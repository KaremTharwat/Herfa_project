import 'package:flutter/material.dart';

class CustomTextOnboarding extends StatelessWidget {
  const CustomTextOnboarding({
    super.key,
    required this.text,
    required this.fontSize,
    this.textAlign,
  });
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: "Tajawal",
      ),
      textAlign: textAlign,
    );
  }
}
