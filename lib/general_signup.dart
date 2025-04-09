import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/views/MaintenanceMan/auth/herafy_login.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_login.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class GeneralSignup extends StatelessWidget {
  const GeneralSignup({super.key});
  static const routName = "generalSignup";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage(ImagesPathApp.generalLoginApp),
            colorFilter:
                ColorFilter.mode(Colors.black.withAlpha(120), BlendMode.darken),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: "تسجيل الدخول",
                fontSize: 28,
                color: ColorsApp.textColorWhite,
              ),
              CustomButton(
                text: "تسجيل دخول كحرفي",
                onTap: () {
                  Navigator.pushNamed(context, HerafyLogin.routName);
                },
              ),
              CustomButton(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Teeeeeest()));
                  Navigator.pushNamed(context, UserLogin.routName);
                },
                text: "تسجيل دخول كعميل",
              )
            ],
          ),
        ),
      ),
    );
  }
}
