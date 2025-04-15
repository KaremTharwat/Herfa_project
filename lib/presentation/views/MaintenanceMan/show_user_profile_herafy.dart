import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/business%20logic/cubits/get_user_data_cubit.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';
import 'package:herfa/data/models/rating_model.dart';
import 'package:herfa/helper/add_order_data.dart';
import 'package:herfa/helper/add_rate_data.dart';
import 'package:herfa/helper/delete_order.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_evaluation.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';
import 'package:herfa/presentation/widgets/custom_title_category_profile.dart';

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
  double rate = 0;
  String? evaluationText;
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    HerafyModel? herafyModel =
        ModalRoute.of(context)!.settings.arguments as HerafyModel;
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
                  CustomText(
                      text: "${herafyModel.phoneNumber}", fontSize: 14),
                  const Icon(
                    Icons.phone,
                    color: ColorsApp.primaryColorAppbarAndCard,
                  ),
                ],
              ),
              CustomText(
                  text:
                      "تقيم العملاء : ${herafyModel.numberOfResidents != 0 ? herafyModel.rate / herafyModel.numberOfResidents : 0} من 5 (${herafyModel.numberOfResidents} تقييم)",
                  fontSize: 12),
              RatingBarIndicator(
                itemSize: 20,
                rating: herafyModel.numberOfResidents != 0 ? herafyModel.rate / herafyModel.numberOfResidents : 0,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
              const CustomTitleCategoryProfile(
                text: "الخبرات",
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    itemCount: herafyModel.experiences.length,
                    itemBuilder: (context, index) => CustomText(
                        text: "${herafyModel.experiences[index]}",
                        fontSize: 16)),
              ),
              const CustomTitleCategoryProfile(
                text: "الخدمات المتوفرة",
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    itemCount: herafyModel.availableServices.length,
                    itemBuilder: (context, index) => CustomText(
                        text: "${herafyModel.availableServices[index]}",
                        fontSize: 16)),
              ),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 141, 141, 141),
              ),
              const CustomTitleCategoryProfile(
                text: "تقييم العملاء",
              ),
              FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection("rate")
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<RatingModel?> ratingList = [];
                                for (int i = 0;
                                    i < snapshot.data!.docs.length;
                                    i++) {
                                  if (snapshot.data!.docs[i]["herafyID"] ==
                                      herafyModel.herafyID) {
                                    ratingList.add(RatingModel.fromJson(
                                        snapshot.data!.docs[i]));
                                  }
                                }
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: ratingList.length,
                                    itemBuilder: (context, index) =>
                                         CustomEvaluation(
                                          ratingModel: ratingList[index],
                                        ),
                                  ),
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
              onTap != true
                  ? CustomButton(
                      text: "اطلب الأن",
                      onTap: () async {
                        onTap = true;
                        setState(() {});
                        BlocProvider.of<GetUserDataCubit>(context)
                            .getUserDataMethodCubit();
      
                        addOrderData(
                            BlocProvider.of<GetUserDataCubit>(context)
                                .userModel!,
                            herafyModel.herafyID);
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => PopScope(
                            canPop: true,
                            child: AlertDialog(
                                backgroundColor:
                                    ColorsApp.primaryColorAppbarAndCard,
                                actions: <Widget>[
                                  Center(
                                      child: Column(
                                    children: [
                                      CustomTextFormField(
                                          onChanged: (value) =>
                                              evaluationText = value,
                                          hintText:
                                              "ادخل تقييمك الكتابي هنا"),
                                      RatingBar.builder(
                                        allowHalfRating: true,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        onRatingUpdate: (value) =>
                                            rate = value,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            addRateData(
                                                BlocProvider.of<
                                                            GetUserDataCubit>(
                                                        context)
                                                    .userModel,
                                                herafyModel.herafyID,
                                                evaluationText ?? "",
                                                rate);
                                            addRating(
                                                herafyModel.herafyID, rate);
                                            BlocProvider.of<
                                                        GetHerafyDataCubit>(
                                                    context)
                                                .getHerafyDataMethodCubit();
      
                                            Navigator.pop(context);
                                          },
                                          child: const Text("تم التقييم"))
                                    ],
                                  ))
                                ]),
                          ),
                        );
                      },
                    )
                  : OutlinedButton(
                      onPressed: () {
                        onTap = false;
                        setState(() {});
                        deleteOrderData(
                            BlocProvider.of<GetUserDataCubit>(context)
                                .userModel!
                                .userID,
                            herafyModel.herafyID,
                            context);
                      },
                      child: const Text("إلغاء الطلب"))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> addRating(String? herafyId, double rate) async {
  final docRef = FirebaseFirestore.instance.collection('herafy').doc(herafyId);

  await docRef.update({
    'rate': FieldValue.increment(rate),
    'numberOfResidents': FieldValue.increment(1),
  });
}
