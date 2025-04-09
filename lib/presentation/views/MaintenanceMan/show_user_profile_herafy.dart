import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfa/business%20logic/cubits/get_user_data_cubit.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';
import 'package:herfa/helper/add_order_data.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_evaluation.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_title_category_profile.dart';

// ignore: must_be_immutable
class ShowUserProfileHerafy extends StatefulWidget {
  const ShowUserProfileHerafy({
    super.key,
  });
  static const routName = "ShowUserProfileHerafy";
  @override
  State<ShowUserProfileHerafy> createState() => _ShowUserProfileHerafyState();
}

class _ShowUserProfileHerafyState extends State<ShowUserProfileHerafy> {
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    HerafyModel? herafyModel =
        ModalRoute.of(context)!.settings.arguments as HerafyModel;
      //  UserModel? userModel = BlocProvider.of<GetUserDataCubit>(context).userModel;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage("${herafyModel.imageUrl}"),
              ),
              CustomText(text: "${herafyModel.herafyName}", fontSize: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "${herafyModel.phoneNumber}", fontSize: 14),
                  const Icon(
                    Icons.phone,
                    color: ColorsApp.primaryColorAppbarAndCard,
                  ),
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
                color: Color.fromARGB(255, 141, 141, 141),
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
             onTap != true ?CustomButton(
                          text: "اطلب الأن",
                          onTap: () async {
                            onTap = true;
                            setState(() {});
                            BlocProvider.of<GetUserDataCubit>(context).getUserDataMethodCubit();
                            
                            addOrderData(BlocProvider.of<GetUserDataCubit>(context).userModel! ,herafyModel.herafyID);
                          },
                        )
                  : OutlinedButton(
                      onPressed: () {
                        onTap = false;
                        setState(() {});
                      },
                      child: const Text("إلغاء الطلب"))
            ],
          ),
        ),
      ),
    );
  }
}
