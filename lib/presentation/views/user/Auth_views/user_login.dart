import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/firebase/auth/user_auth/singin_with_emailandpassword.dart';
import 'package:herfa/helper/showsnackbar.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_signup.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_row_divider.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});
  static const userLogin = "/userLogin";
  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> formkey = GlobalKey();
  bool isHidden = true;
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesPathApp.loginPerson),
              colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(120), BlendMode.darken),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 170, bottom: 50),
                    child: CustomText(
                      text: "تسجيل الدخول كعميل",
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "البريد الالكتروني",
                      fontSize: 18,
                      color: ColorsApp.textColorWhite,
                    ),
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.emailAddress,
                    hintText: " ادخل البريد الالكتروني",
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "الرجاء ادخال البريد الالكتروني ";
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[g-m-a-i.l]+\.[c-o-m]{2,}$')
                          .hasMatch(text)) {
                        return "الرجاء ادخال البريد الالكتروني بشكل صحيح";
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: "كلمة المرور",
                      fontSize: 18,
                      color: ColorsApp.textColorWhite,
                    ),
                  ),
                  CustomTextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "الرجاء ادخال كلمة المرور ";
                      } else if (text.length < 6) {
                        return "كلمة المرور يجب ان تكون اكثر من 6 احرف";
                      }
                      return null;
                    },
                    hintText: "ادخل كلمة المرور",
                    iconButton: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        icon: isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility)),
                    obscureText: isHidden,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "هل نسيت كلمة المرور؟",
                        style: TextStyle(
                            color: ColorsApp.textColorWhite, fontSize: 18),
                      ),
                    ),
                  ),
                  isLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                          text: "تسجيل الدخول",
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              try {
                                isLoading = true;
                                setState(() {});
                                await signInEmailAndPassword(email, password);
                                isLoading = false;
                                setState(() {});
                                if (context.mounted) {
                                  Navigator.pushNamed(context, "/homeScreen");
                                }
                              } on FirebaseAuthException catch (e) {
                                isLoading = false;
                                setState(() {});
                                if (e.code == 'invalid-credential') {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        "البريد الالكتروني او كلمة المرور غير صحيحة");
                                  }
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  showSnackBar(context, e.toString());
                                }
                              }
                            }
                          },
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomRowDivider(),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/google.svg",
                      width: 35,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "ليس لديك حساب؟",
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, UserSignup.userSignup);
                          },
                          child: Text(
                            "انشاء حساب جديد",
                            style: TextStyle(
                                color: Color(0xff1732DF),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ))
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
