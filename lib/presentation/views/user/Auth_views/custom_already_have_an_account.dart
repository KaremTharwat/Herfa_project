import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_login.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomAlreadyHaveAnAccount extends StatelessWidget {
  const CustomAlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "هل لديك حساب بالفعل؟",
          fontSize: 18,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, UserLogin.userLogin);
          },
          child: Text(
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
