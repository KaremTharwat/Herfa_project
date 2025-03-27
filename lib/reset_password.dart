import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/helper/send_reset_password.dart';
import 'package:herfa/helper/showsnackbar.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static const routName = "/resetPassword";

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundcolorScreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(text: 'تعيين كلمة مرور جديدة', fontSize: 24),
              const CustomText(
                text:
                    'أدخل بريدك الإلكتروني وسوف تصلك رسالة من الجيميل الخاص بك لتعيين كلمة سر جديدة',
                fontSize: 14,
                color: Colors.grey,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: CustomText(text: "البريد الإلكتروني", fontSize: 24),
              ),
              CustomTextFormField(
                textInputType: TextInputType.emailAddress,
                hintText: " ادخل البريد الالكتروني",
                onFieldSubmitted: (value) async {
                  if (value != "") {
                    await sendResetPassword(value);
                    if (context.mounted) {
                      AwesomeDialog(
                              context: context,
                              desc:
                                  "تم ارسال رسالة الي بريدك الالكتروني لتعين كلمة المرور الجديدة",
                              dialogType: DialogType.success,
                              animType: AnimType.bottomSlide)
                          .show();
                    }
                  } else {
                    showSnackBar(context, "الرجاء ادخال البريد الاليكتروني");
                  }
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
            ],
          ),
        ),
      ),
    );
  }
}
