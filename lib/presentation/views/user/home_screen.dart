import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/get_user_data_cubit.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/views/MaintenanceMan/categories/list_of_herafy.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';
import 'package:herfa/presentation/widgets/custom_category_herfa.dart';
import 'package:herfa/presentation/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routName = "/homeScreen";
  final List<String> title = [
    "سباك",
    "كهربائي",
    "نجار",
    "ميكانيكي",
    "تشطيبات",
    "حداد",
    "سيراميك",
    "الوميتال",
    "اعمال بناء",
    "خدمات متنوعة",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title:
              "مرحباً👋🏻 ${BlocProvider.of<GetUserDataCubit>(context).userModel!.userName}",
          centerTitle: false,
          showIconButton: false,
        ),
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width - 130,
          child: const CustomDrawer(),
        ),
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.6, mainAxisSpacing: 25),
          children: [
            CustomCategoryHerfa(
                title: title[0],
                image: ImagesPathApp.plumber,
                onTap: ()async {
                  Navigator.pushNamed(context, ListOfHerafy.routName,
                      arguments: title[0]);
              
                }),
            CustomCategoryHerfa(
              title: title[1],
              image: ImagesPathApp.electrical,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[1]),
            ),
            CustomCategoryHerfa(
              title: title[2],
              image: ImagesPathApp.joiner,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[2]),
            ),
            CustomCategoryHerfa(
              title: title[3],
              image: ImagesPathApp.mechanical,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[3]),
            ),
            CustomCategoryHerfa(
              title: title[4],
              image: ImagesPathApp.finishes,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[4]),
            ),
            CustomCategoryHerfa(
              title: title[5],
              image: ImagesPathApp.blacksmith,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[5]),
            ),
            CustomCategoryHerfa(
              title: title[6],
              image: ImagesPathApp.ceramicWorks,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[6]),
            ),
            CustomCategoryHerfa(
              title: title[7],
              image: ImagesPathApp.metalTechnician,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[7]),
            ),
            CustomCategoryHerfa(
              title: title[8],
              image: ImagesPathApp.constructionWork,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[8]),
            ),
            CustomCategoryHerfa(
              title: title[9],
              image: ImagesPathApp.various,
              onTap: () => Navigator.pushNamed(context, ListOfHerafy.routName,
                  arguments: title[9]),
            ),
          ],
        ));
  }
}
