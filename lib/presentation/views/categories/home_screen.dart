import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/get_data_cubit.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/views/categories/plumber.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';
import 'package:herfa/presentation/widgets/custom_category_herfa.dart';
import 'package:herfa/presentation/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String homeScreen = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title:
              "مرحباً👋🏻 ${BlocProvider.of<GetDataCubit>(context).userModel!.userName}",
          centerTitle: false,
        ),
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width - 130,
          child:const CustomDrawer(),
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
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
            CustomCategoryHerfa(
              title: "سباك",
              image: ImagesPathApp.plumber,
              onTap: () => Navigator.pushNamed(context, Plumber.plumber),
            ),
          ],
        ));
  }
}
