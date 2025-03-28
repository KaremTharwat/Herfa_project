import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/get_data_cubit.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/firebase/auth/user_auth/singin_with_emailandpassword.dart';
import 'package:herfa/helper/showsnackbar.dart';
import 'package:herfa/presentation/views/MaintenanceMan/auth/herafy_singup.dart';
import 'package:herfa/presentation/views/MaintenanceMan/profile_herafy.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_doyouhavean_account.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';

class HerafyLogin extends StatefulWidget {
  const HerafyLogin({super.key});
  static const routName = "HerafyLogin";
  @override
  State<HerafyLogin> createState() => _HerafyLoginState();
}

final GlobalKey<FormState> formkey = GlobalKey();
bool isHidden = true;
String? email;
String? password;
bool isLoading = false;

class _HerafyLoginState extends State<HerafyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage(ImagesPathApp.loginHerafy),
            colorFilter:
                ColorFilter.mode(Colors.black.withAlpha(140), BlendMode.darken),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 170, bottom: 50),
                    child: CustomText(
                        text: "تسجيل الدخول كحرفي",
                        fontSize: 24,
                        color: ColorsApp.textColorWhite),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                        text: "البريد الإلكتروني",
                        fontSize: 22,
                        color: ColorsApp.textColorWhite),
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
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                        text: 'كلمة المرور',
                        fontSize: 22,
                        color: ColorsApp.textColorWhite),
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
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : const Icon(Icons.visibility,
                                color: Colors.black)),
                    obscureText: isHidden,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "هل نسيت كلمة المرور؟",
                        style: TextStyle(
                            color: ColorsApp.textColorWhite, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "تسجيل الدخول",
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              try {
                                isLoading = true;
                                setState(() {});
                                await signInEmailAndPassword(email, password);
                                await BlocProvider.of<GetDataCubit>(context)
                                    .getDataMethodCubit();
                                if (context.mounted) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    ProfileHerafy.routName,
                                    (route) => false,
                                  );
                                }
                                isLoading = false;
                                setState(() {});
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
                                  print(e.toString());
                                  isLoading = false;
                                  setState(() {});
                                }
                              }
                            }
                          },
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomDoYouNotHaveAnAccount(
                      routName: HerafySignUp.routName)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
