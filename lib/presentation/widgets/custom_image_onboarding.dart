import 'package:flutter/material.dart';
import 'package:herfa/general_signup.dart';

class CustomImageOnbarding extends StatelessWidget {
  const CustomImageOnbarding({
    super.key,
    required this.pathImage,
  });
  final String pathImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, GeneralSignup.routName);
          },
          child:const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "تخطي",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
        ),
        Image.asset(
          pathImage,
          width: 300,
          height: 300,
        ),
      ],
    );
  }
}
