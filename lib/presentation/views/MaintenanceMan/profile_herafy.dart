import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/views/MaintenanceMan/service_request_notification.dart';
import 'package:herfa/presentation/widgets/custom_evaluation.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_title_category_profile.dart';

class ProfileHerafy extends StatelessWidget {
  const ProfileHerafy({super.key});
  static const routName = "profileHerafy";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColorAppbarAndCard,
        centerTitle: true,
        title: const CustomText(text: 'الملف الشخصي', fontSize: 20),
        leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ServiceRequestNotification.routName);
              },
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
            Stack(children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.imageUrl}"),
              ),
              Positioned(
                bottom: 10,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30),
                      color: ColorsApp.textColorWhite,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 35,
                      color: ColorsApp.primaryColorAppbarAndCard,
                    ),
                  ),
                ),
              ),
            ]),
            CustomText(
                text:
                    "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.herafyName}",
                fontSize: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text:
                        "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.phoneNumber}",
                    fontSize: 14),
                const Icon(Icons.phone),
              ],
            ),
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
            const CustomTitleCategoryProfile(
              text: "الخبرات",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) =>const Text("fgdg"),
              ),
            ),
            const CustomTitleCategoryProfile(
              text: "الخدمات المتوفرة",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) =>const Text("fgdg"),
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
          ],
        ),
      ),
    );
  }
}
