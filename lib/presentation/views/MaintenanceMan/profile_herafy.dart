import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_evaluation.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_title_category_profile.dart';

class ProfileHerafy extends StatelessWidget {
  const ProfileHerafy({super.key});
  static const routName = "profileHerafy";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundcolorScreen,
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColorAppbarAndCard,
        centerTitle: true,
        title: const CustomText(text: 'الملف الشخصي', fontSize: 20),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 36,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.imageUrl}"),
            ),
            CustomText(
                text:
                    "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.herafyName}",
                fontSize: 16),
            const CustomText(
                text: "تقيم العملاء : 4 من 5 (200 تقييم)", fontSize: 12),
            RatingBarIndicator(
              itemSize: 20,
              rating: 1,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
            // RatingBar.builder(
            //   initialRating: 1,
            //   minRating: 1,
            //   allowHalfRating: true,
            //   itemSize: 20,
            //   itemBuilder: (context, index) {
            //     return const Icon(
            //       Icons.star,
            //       Colors.yellow,
            //     );
            //   },
            //   onRatingUpdate: (value) => print(value),
            // ),
            const CustomTitleCategoryProfile(
              text: "الخبرات",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => Text("fgdg"),
              ),
            ),
            const CustomTitleCategoryProfile(
              text: "الخدمات المتوفرة",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Text("fgdg"),
              ),
            ),
            const Divider(
              thickness: 2,
              color: ColorsApp.textColorblack,
            ),
            const CustomTitleCategoryProfile(
              text: "أراء العملاء",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => const CustomEvaluation(),
              ),
            ),
            const CustomText(text: "تواصل معنا", fontSize: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.phone),
                    Text("الهاتف"),
                    Text("01015143078")
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Icon(Icons.location_city),
                    Text("العنوان"),
                    Text("القاهرة , الشروق")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

