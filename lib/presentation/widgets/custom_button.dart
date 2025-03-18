import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: ColorsApp.buttonsColor,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              text,
              style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
