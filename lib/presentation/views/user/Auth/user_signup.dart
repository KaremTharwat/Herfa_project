import 'package:flutter/material.dart';
import 'package:herfa/helper/validation_confirmpassword.dart';
import 'package:herfa/helper/validation_email_address.dart';
import 'package:herfa/helper/validation_password.dart';
import 'package:herfa/helper/validation_phone_number.dart';
import 'package:herfa/helper/validation_username.dart';
import 'package:herfa/presentation/views/user/Auth/custom_already_have_an_account.dart';
import 'package:herfa/presentation/views/user/home_screen.dart';
import 'package:herfa/presentation/widgets/custom_align_textformfield.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_dropdownmenu_andtextfield.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});
  static const userSignup = "/user-signup";

  @override
  State<UserSignup> createState() => _UserSignupState();
}

String? selectedValue;
dynamic confirmpassord;
GlobalKey<FormState> formkey = GlobalKey();
bool obscureText = true;
final List<String> listOfGovernorates = [
  "القاهرة",
  "الجيزة",
  "القليوبية",
  "الشرقية",
  "المنوفية"
];

class _UserSignupState extends State<UserSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  CustomText(text: "تسجيل كعميل", fontSize: 28),
                  CustomText(text: "مرحبا! يرجي انشاء حساب جديد", fontSize: 18),
                  //----------- username field --------------
                  CustomAlignTextFormField(
                    text: "الاسم",
                  ),
                  CustomTextFormField(
                      hintText: "ادخل الاسم ثلاثي هنا ",
                      validator: (value) {
                        return validationUserName(value);
                      }),
                  // ---------- phone field --------------
                  CustomAlignTextFormField(
                    text: "رقم الهاتف",
                  ),
                  CustomTextFormField(
                      textInputType: TextInputType.phone,
                      hintText: "ادخل رقم الهاتف ",
                      validator: (value) {
                        return validationPhoneNumber(value);
                      }),
                  //----------- email field -------------
                  CustomAlignTextFormField(
                    text: "البريد الالكتروني",
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.emailAddress,
                    hintText: "ادخل البريد الالكتروني ",
                    validator: (value) {
                      return validationEmailAddress(value);
                    },
                  ),
                  CustomDropdownmenuAndtextfield(),
                  //-------------- password filed --------------
                  CustomAlignTextFormField(
                    text: "كلمة المرور",
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    obscureText: obscureText,
                    iconButton: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    hintText: "ادخل كلمة المرور ",
                    validator: (value) {
                      return validationPassword(value);
                    },
                  ),
                  //---------- confirm password field ----------
                  CustomAlignTextFormField(
                    text: "تأكيد كلمة المرور",
                  ),
                  CustomTextFormField(
                      obscureText: obscureText,
                      hintText: "تأكيد كلمة المرور",
                      validator: (value) {
                        return validationconfirmPassword(value);
                      }),
                  //-----------button----------
                  CustomButton(
                    text: "إنشاء حساب جديد",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.pushNamed(context, HomeScreen.homeScreen);
                      }
                    },
                  ),
                  CustomAlreadyHaveAnAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
