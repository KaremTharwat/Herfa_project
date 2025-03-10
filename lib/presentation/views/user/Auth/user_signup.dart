import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/user/Auth/user_login.dart';
import 'package:herfa/presentation/views/user/home_screen.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});
  static const userSignup = "/user-signup";

  @override
  State<UserSignup> createState() => _UserSignupState();
}

String selectedValue = "القاهرة";
dynamic confirmpassord;
GlobalKey<FormState> formkey = GlobalKey();
bool obscureText = true;

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
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "الاسم",
                      fontSize: 18,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "ادخل الاسم ثلاثي هنا ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء ادخال الاسم";
                      } else if (!RegExp(r'^[ء-ي\s]+$').hasMatch(value)) {
                        return "ألرجاء ادخال الاسم بالعربية و بدون رموز";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "رقم الهاتف",
                      fontSize: 18,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "ادخل رقم الهاتف ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء ادخال رقم الهاتف";
                      } else if (value.length < 11) {
                        return "الرجاء ادخال رقم هاتف صحيح";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "البريد الالكتروني",
                      fontSize: 18,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "ادخل البريد الالكتروني ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "الرجاء ادخال البريد الالكتروني";
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[g-m-a-i-l]+\.[c-o-m]{2,}$')
                          .hasMatch(value)) {
                        return "الرجاء ادخال رقم هاتف صحيح";
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      DropdownButton(
                        hint: Text("اختر محافظة"),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        items: [
                          "القاهرة",
                          "الجيزة",
                          "القليوبية",
                          "الشرقية",
                          "المنوفية"
                        ].map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                            hintText: "ادخل اسم المدينة التابعة للمحافظة"),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "كلمة المرور",
                      fontSize: 18,
                    ),
                  ),
                  CustomTextFormField(
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
                      confirmpassord = value;
                      if (value!.isEmpty) {
                        return "الرجاء ادخال كلمة المرور ";
                      } else if (value.length < 6) {
                        return "الرجاء ادخال كلمة المرور اكثر من 6 احرف";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "تأكيد كلمة المرور",
                      fontSize: 18,
                    ),
                  ),
                  CustomTextFormField(
                    obscureText: obscureText,
                    hintText: "تأكيد كلمة المرور",
                    validator: (value) {
                      if (confirmpassord != value) {
                        return "كلمة المرور غير مطابقه";
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    text: "إنشاء حساب جديد",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.pushNamed(context, HomeScreen.homeScreen);
                      }
                    },
                  ),
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
      ),
    );
  }
}
