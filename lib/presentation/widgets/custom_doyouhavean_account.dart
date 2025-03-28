import 'package:flutter/material.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_text_button.dart';

class CustomDoYouNotHaveAnAccount extends StatelessWidget {
  const CustomDoYouNotHaveAnAccount({
    super.key, required this.routName,
  });
  final String routName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomText(
          text: "ليس لديك حساب؟",
          fontSize: 20,
          color: Colors.white,
        ),
        CustomTextButton(
          text: "انشاء حساب جديد",
          color: const Color(0xff1732DF),
          onPressed: () {
            Navigator.pushNamed(context, routName);
          },
        )
      ],
    );
  }
}
