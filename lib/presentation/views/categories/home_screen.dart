import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/models/user_model/user_model.dart';
import 'package:herfa/presentation/views/categories/plumber.dart';
import 'package:herfa/presentation/widgets/custom_category_herfa.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String homeScreen = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    final UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.primaryColorAppbarAndCard,
          title: Text("مرحباً👋🏻 ${userModel.userName}"),
        ),
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width - 130,
          child: Drawer(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero, 
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                        weight: 700,
                        size: 40,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(text: "${userModel.userName}", fontSize: 18),
                  CustomText(
                    text: "${userModel.email}",
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: ColorsApp.primaryColorAppbarAndCard,
                      ),
                      Text("الصفحة الرئيسية")
                      // CustomText(
                      //   text: "الصفحة الرئيسية",
                      //   fontSize: 18,
                      // )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.6, mainAxisSpacing: 25),
          children: [
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
          ],
        ));
  }
}
