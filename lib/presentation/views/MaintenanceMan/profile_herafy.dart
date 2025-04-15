import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/business%20logic/states/user_state.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';
import 'package:herfa/data/models/rating_model.dart';
import 'package:herfa/helper/get_herafy_data.dart';
import 'package:herfa/presentation/views/MaintenanceMan/edite_profile.dart';
import 'package:herfa/presentation/views/MaintenanceMan/service_request_notification.dart';
import 'package:herfa/presentation/widgets/custom_evaluation.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_title_category_profile.dart';

// ignore: must_be_immutable
class ProfileHerafy extends StatefulWidget {
  const ProfileHerafy({super.key});
  static const routName = "profileHerafy";

  @override
  State<ProfileHerafy> createState() => _ProfileHerafyState();
}

class _ProfileHerafyState extends State<ProfileHerafy> {
  Future<void> refresh() async {
    setState(() {});
  }

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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          children:[FutureBuilder<HerafyModel?>(
              future: getHerafyData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                NetworkImage("${snapshot.data!.imageUrl}"),
                          ),
                          Positioned(
                            bottom: 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, EditeProfile.routName);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(30),
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
                            text: "${snapshot.data!.herafyName}", fontSize: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "${snapshot.data!.phoneNumber}",
                                fontSize: 14),
                            const Icon(Icons.phone),
                          ],
                        ),
                        CustomText(
                            text:
                                "تقيم العملاء : ${snapshot.data!.numberOfResidents != 0 ? snapshot.data!.rate / snapshot.data!.numberOfResidents : 0} من 5 (${snapshot.data!.numberOfResidents} تقييم)",
                            fontSize: 12),
                        RatingBarIndicator(
                          itemSize: 20,
                          rating: snapshot.data!.numberOfResidents != 0
                              ? snapshot.data!.rate /
                                  snapshot.data!.numberOfResidents
                              : 0,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                        const CustomTitleCategoryProfile(
                          text: "الخبرات",
                        ),
                        BlocBuilder<GetHerafyDataCubit, GetDataState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: 60,
                              child: ListView.builder(
                                itemCount:
                                    BlocProvider.of<GetHerafyDataCubit>(context)
                                        .herafyModel!
                                        .experiences
                                        .length,
                                itemBuilder: (context, index) => Text(
                                    "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.experiences[index]}"),
                              ),
                            );
                          },
                        ),
                        const CustomTitleCategoryProfile(
                          text: "الخدمات المتوفرة",
                        ),
                        BlocBuilder<GetHerafyDataCubit, GetDataState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: 60,
                              child: ListView.builder(
                                itemCount:
                                    BlocProvider.of<GetHerafyDataCubit>(context)
                                        .herafyModel!
                                        .availableServices
                                        .length,
                                itemBuilder: (context, index) => Text(
                                    "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.availableServices[index]}"),
                              ),
                            );
                          },
                        ),
                        const Divider(
                          thickness: 2,
                          color: ColorsApp.textColorblack,
                        ),
                        const CustomTitleCategoryProfile(
                          text: "أراء العملاء",
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
                                      BlocProvider.of<GetHerafyDataCubit>(
                                              context)
                                          .herafyModel!
                                          .herafyID) {
                                    ratingList.add(RatingModel.fromJson(
                                        snapshot.data!.docs[i]));
                                  }
                                }
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: ratingList.length,
                                  itemBuilder: (context, index) =>
                                      CustomEvaluation(
                                    ratingModel: ratingList[index],
                                  ),
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          ]
        ),
      ),
    );
  }
}
