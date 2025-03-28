import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomAlreadyHaveAnAccount extends StatelessWidget {
  const CustomAlreadyHaveAnAccount({
    super.key,required this.routName,
  });
  final String routName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomText(
          text: "هل لديك حساب بالفعل؟",
          fontSize: 18,
          color: ColorsApp.textColorblack,
        ),
        TextButton(
          onPressed:()=>  Navigator.pushReplacementNamed(
                      context, routName),
          child: const Text(
            "تسجيل دخول",
            style: TextStyle(
                color: Color(0xff1732DF),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        )
      ],
    );
  }
}
