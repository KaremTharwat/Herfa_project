import 'package:flutter/material.dart';

class CustomImageOnbarding extends StatelessWidget {
  const CustomImageOnbarding({
    super.key,
    required this.pathImage,
  });
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 290,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "تخطي",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
        ),
        Image.asset(
          pathImage,
        ),
      ],
    );
  }
}
