import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/get_data_cubit.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/general_signup.dart';
import 'package:herfa/helper/sign_out_auth.dart';
import 'package:herfa/presentation/views/user/home_screen.dart';
import 'package:herfa/presentation/widgets/Custom_switch.dart';
import 'package:herfa/presentation/widgets/custom_row_drawer.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_text_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).iconTheme.color,
                  weight: 700,
                  size: 40,
                )),
            const SizedBox(
              height: 25,
            ),
            CustomText(
                text:
                    "${BlocProvider.of<GetDataCubit>(context).userModel!.userName}",
                fontSize: 18),
            CustomText(
              text:
                  "${BlocProvider.of<GetDataCubit>(context).userModel!.email}",
              fontSize: 18,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomRowDrawer(
              text: "الصفحة الرئيسية",
              iconData: Icons.home,
              onTap: () => Navigator.pushNamed(context, HomeScreen.routName),
            ),
            const CustomRowDrawer(
              text: "اشعار",
              iconData: Icons.notifications,
            ),
            const CustomRowDrawer(
              text: "سجل المعاملات",
              iconData: Icons.history,
            ),
            CustomRowDrawer(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      backgroundColor: ColorsApp.primaryColorAppbarAndCard,
                      actions: <Widget>[
                        Center(
                          child: Transform.scale(
                            scaleY: 2,
                            scaleX: 2.2,
                            child: const SizedBox(
                              height: 150,
                              child: CustomSwitchDarkAndLightMode(),
                            ),
                          ),
                        )
                      ]),
                );
              },
              text: "وضع النظام",
              iconData: Icons.dark_mode,
            ),
            const CustomRowDrawer(
              text: "الاعدادات",
              iconData: Icons.settings,
            ),
            CustomRowDrawer(
              text: "تسجيل خروج",
              iconData: Icons.login,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const CustomText(
                              text: "هل ترغب في تسجيل الخروج؟", fontSize: 16),
                          actions: [
                            CustomTextButton(
                              text: "تسجيل الخروج",
                              color: Colors.red,
                              onPressed: () async {
                                await userSignOut();
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    GeneralSignup.routName,
                                    (route)=>false);
                              },
                            ),
                            CustomTextButton(
                              text: "الغاء",
                              color: Colors.blueAccent,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
