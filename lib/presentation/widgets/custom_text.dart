import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.textAlign, this.color,
  });
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final Color? color ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: "Tajawal",
        color: color,
      ),
      textAlign: textAlign
    );
  }
}
