import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/user_cubit/get_data_cubit.dart';
import 'package:herfa/data/firebase/auth/user_auth/signupwithemailandpassword.dart';
import 'package:herfa/helper/showsnackbar.dart';
import 'package:herfa/helper/validation_confirmpassword.dart';
import 'package:herfa/helper/validation_email_address.dart';
import 'package:herfa/helper/validation_password.dart';
import 'package:herfa/helper/validation_phone_number.dart';
import 'package:herfa/helper/validation_username.dart';
import 'package:herfa/presentation/views/categories/home_screen.dart';
import 'package:herfa/presentation/views/user/Auth_views/custom_already_have_an_account.dart';
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

bool isLoading = false;
String? email;
String? password;
String? userName;
String? phoneNumber;
String? cityName;
String? governorateName;
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
                  const CustomText(text: "تسجيل كعميل", fontSize: 28),
                  const CustomText(
                      text: "مرحبا! يرجي انشاء حساب جديد", fontSize: 18),
                  //----------- username field --------------
                  const CustomAlignTextFormField(
                    text: "الاسم",
                  ),
                  CustomTextFormField(
                      onChanged: (value) => userName = value,
                      hintText: "ادخل الاسم ثلاثي هنا ",
                      validator: (value) {
                        return validationUserName(value);
                      }),
                  // ---------- phone field --------------
                  const CustomAlignTextFormField(
                    text: "رقم الهاتف",
                  ),
                  CustomTextFormField(
                      onChanged: (value) => phoneNumber = value,
                      textInputType: TextInputType.phone,
                      hintText: "ادخل رقم الهاتف ",
                      validator: (value) {
                        return validationPhoneNumber(value);
                      }),
                  //----------- email field -------------
                  const CustomAlignTextFormField(
                    text: "البريد الالكتروني",
                  ),
                  CustomTextFormField(
                    onChanged: (value) => email = value,
                    textInputType: TextInputType.emailAddress,
                    hintText: "ادخل البريد الالكتروني ",
                    validator: (value) {
                      return validationEmailAddress(value);
                    },
                  ),
                  const CustomDropdownmenuAndtextfield(),
                  //-------------- password filed --------------
                  const CustomAlignTextFormField(
                    text: "كلمة المرور",
                  ),
                  CustomTextFormField(
                    onChanged: (value) => password = value,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: obscureText,
                    iconButton: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    hintText: "ادخل كلمة المرور ",
                    validator: (value) {
                      return validationPassword(value);
                    },
                  ),
                  //---------- confirm password field ----------
                  const CustomAlignTextFormField(
                    text: "تأكيد كلمة المرور",
                  ),
                  CustomTextFormField(
                      obscureText: obscureText,
                      hintText: "تأكيد كلمة المرور",
                      validator: (value) {
                        return validationconfirmPassword(value);
                      }),
                  //-----------button----------
                  isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "إنشاء حساب جديد",
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              try {
                                isLoading = true;
                                setState(() {});
                                await signUpEmailAndPassword(email, password,
                                    userName, cityName, governorateName);
                                isLoading = false;
                                setState(() {});
                                await BlocProvider.of<GetDataCubit>(context)
                                    .getDataMethodCubit();
                                if (context.mounted) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    HomeScreen.homeScreen,
                                    (route) => false,
                                  );
                                }
                              } on FirebaseAuthException catch (e) {
                                isLoading = false;
                                setState(() {});
                                if (e.code == 'weak-password') {
                                  if (context.mounted) {
                                    showSnackBar(context, "كلمة المرور ضعيفة");
                                  }
                                } else if (e.code == 'email-already-in-use') {
                                  if (context.mounted) {
                                    showSnackBar(context,
                                        "هذا البريد الالكتروني مستخدم بالفعل");
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

                  const CustomAlreadyHaveAnAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
