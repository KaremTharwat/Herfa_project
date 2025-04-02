import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/firebase/auth/MaintenanceMan_auth/signup_withemailandpassword_herafy.dart';
import 'package:herfa/helper/showsnackbar.dart';
import 'package:herfa/helper/upload_images.dart';
import 'package:herfa/helper/validation_confirmpassword.dart';
import 'package:herfa/helper/validation_email_address.dart';
import 'package:herfa/helper/validation_password.dart';
import 'package:herfa/helper/validation_phone_number.dart';
import 'package:herfa/helper/validation_username.dart';
import 'package:herfa/presentation/views/MaintenanceMan/auth/herafy_login.dart';
import 'package:herfa/presentation/views/MaintenanceMan/profile_herafy.dart';
import 'package:herfa/presentation/widgets/custom_already_have_an_account.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_drop_dowen_major.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';
import 'package:image_picker/image_picker.dart';

class HerafySignUp extends StatefulWidget {
  const HerafySignUp({super.key});
  static const routName = "HerafySingUp";
  @override
  State<HerafySignUp> createState() => _HerafySignUpState();
}

String? major;

class _HerafySignUpState extends State<HerafySignUp> {
  bool obscureText = true;
  File? file;
  String? base64Image;
  String? herafyName;
  String? age;
  String? email;
  String? phoneNumber;
  String? password;

  List<String> listOfHerafy = [
    "سباك",
    "كهربائي",
    "نجار",
    "ميكانيكي",
    "تشطيبات",
    "حداد",
    "سيراميك"
  ];
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundcolorScreen,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const CustomText(text: "التسجيل كحرفي", fontSize: 24),
                const CustomText(
                    text: "مرحبا! يرجي إنشاء حساب جديد", fontSize: 18),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'الاسم ',
                    fontSize: 16,
                  ),
                ),
                CustomTextFormField(
                  hintText: "ادخل الاسم كامل ",
                  onChanged: (value) => herafyName = value,
                  validator: (value) {
                    return validationUserName(value);
                  },
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'العمر',
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextFormField(
                      hintText: "ادخل العمر الحالي",
                      onChanged: (value) => age = value,
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الرجاء ادخال العمر";
                        } else if (value.length > 2) {
                          return "ادخل العمر الحالي";
                        }
                        return null;
                      },
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        tackPhoto();
                      },
                      child: const Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: ColorsApp.textColorWhite,
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                          CustomText(text: 'أضف صورة شخصية', fontSize: 14)
                        ],
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomDropdownMenuMajor(
                    title: "اختر التخصص",
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'البريد الالكتروني',
                    fontSize: 16,
                  ),
                ),
                CustomTextFormField(
                    hintText: "ادخل البريد الاليكتروني",
                    onChanged: (value) => email = value,
                    validator: (value) {
                      return validationEmailAddress(value);
                    }),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'رقم الهاتف',
                    fontSize: 16,
                  ),
                ),
                CustomTextFormField(
                  hintText: "ادخل رقم الهاتف ",
                  onChanged: (value) => phoneNumber = value,
                  validator: (value) => validationPhoneNumber(value),
                  textInputType: TextInputType.phone,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'كلمة المرور',
                    fontSize: 16,
                  ),
                ),
                CustomTextFormField(
                  onChanged: (value) => password = value,
                  obscureText: obscureText,
                  hintText: "ادخل كلمة المرور",
                  validator: (value) => validationPassword(value),
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
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'تأكيد كلمة المرور',
                    fontSize: 16,
                  ),
                ),
                CustomTextFormField(
                  obscureText: obscureText,
                  hintText: "تاكيد كلمة المرور",
                  validator: (value) => validationconfirmPassword(value),
                ),
                isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: "انشاء حساب",
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            try {
                              isLoading = true;
                              setState(() {});
                              await uploadImage(file);
                              await signUpEmailAndPasswordHerafy(
                                  email, age, password, herafyName, major,imageUrl);
                              isLoading = false;
                              setState(() {});
                              if (context.mounted) {
                                await BlocProvider.of<GetHerafyDataCubit>(
                                        context)
                                    .getHerafyDataMethodCubit();
                              }

                              if (context.mounted) {
                                Navigator.pushNamed(
                                  context,
                                  ProfileHerafy.routName,
                                  // (route) => false,
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
                                print(e.toString());
                                showSnackBar(context, e.toString());
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          }
                        },
                      ),
                const CustomAlreadyHaveAnAccount(
                  routName: HerafyLogin.routName,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> tackPhoto() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        file = File(imageFile.path);
      });
      List<int> imageBytes = await file!.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }
  }
}
