import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/user_cubit/get_data_cubit.dart';
import 'package:herfa/presentation/views/categories/home_screen.dart';
import 'package:herfa/presentation/widgets/custom_row_drawer.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

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
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
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
              onTap: () => Navigator.pushNamed(context, HomeScreen.homeScreen),
            ),
            const CustomRowDrawer(
              text: "اشعار",
              iconData: Icons.notifications,
            ),
            const CustomRowDrawer(
              text: "سجل المعاملات",
              iconData: Icons.history,
            ),
            const CustomRowDrawer(
              text: "وضع النظام",
              iconData: Icons.dark_mode,
            ),
            const CustomRowDrawer(
              text: "الاعدادات",
              iconData: Icons.settings,
            ),
            const CustomRowDrawer(
              text: "تسجيل خروج",
              iconData: Icons.login,
            ),
          ],
        ),
      ),
    );
  }
}
