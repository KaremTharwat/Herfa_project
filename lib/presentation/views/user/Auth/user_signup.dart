import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/user/Auth/user_login.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';

class UserSignup extends StatelessWidget {
  const UserSignup({super.key});
  static const userSignup = "/user-signup";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(text: "تسجيل كعميل", fontSize: 28),
                CustomText(text: "مرحبا! يرجي انشاء حساب جديد", fontSize: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "الاسم",
                    fontSize: 18,
                  ),
                ),
                CustomTextFormField(hintText: "ادخل الاسم ثلاثي هنا "),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "رقم الهاتف",
                    fontSize: 18,
                  ),
                ),
                CustomTextFormField(hintText: "ادخل رقم الهاتف "),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "البريد الالكتروني",
                    fontSize: 18,
                  ),
                ),
                CustomTextFormField(hintText: "ادخل البريد الالكتروني "),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "الموقع",
                    fontSize: 18,
                  ),
                ),
                CustomTextFormField(hintText: "ادخل اسم المحافظة "),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "كلمة المرور",
                    fontSize: 18,
                  ),
                ),
                CustomTextFormField(hintText: "ادخل كلمة المرور "),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "تأكيد كلمة المرور",
                    fontSize: 18,
                  ),
                ),
                CustomTextFormField(hintText: "تأكيد كلمة المرور"),
                CustomButton(text: "إنشاء حساب جديد"),
                Row(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
