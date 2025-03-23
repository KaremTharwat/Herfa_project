import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/change_mode_cubit.dart';
import 'package:herfa/business%20logic/cubits/get_data_cubit.dart';
import 'package:herfa/business%20logic/states/change_mode_state.dart';
import 'package:herfa/constans.dart';
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
            CustomRowDrawer(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                    BlocBuilder<ChangeModeCubit, ChangeModeState>(
                    builder: (context, state) {
                      return AlertDialog(
                          backgroundColor: ColorsApp.primaryColorAppbarAndCard,
                          actions: <Widget>[
                            Center(
                              child: Transform.scale(
                                scaleY: 2,
                                scaleX: 2.2,
                                child: SizedBox(
                                  height: 150,
                                  child: Switch(
                                    activeColor: Colors.white,
                                    activeTrackColor: Colors.black,
                                    inactiveTrackColor: Colors.white,
                                    inactiveThumbColor: Colors.black,
                                    value: BlocProvider.of<ChangeModeCubit>(
                                            context)
                                        .isDark,
                                    onChanged: (value) {
                                      BlocProvider.of<ChangeModeCubit>(context)
                                          .changeMode(value);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ]);
                    },
                  ),
                );
              },
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
