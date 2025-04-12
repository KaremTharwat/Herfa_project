import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';
import 'package:herfa/presentation/widgets/custom_title_category_profile.dart';

// ignore: must_be_immutable
class EditeProfile extends StatelessWidget {
  EditeProfile({super.key});
  static const String routName = "EditeProfile";
  String? herafyName;
  String? experiences;
  String? availableServices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "تعديل الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.imageUrl}"),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "تغير الصورة",
                    fontSize: 20,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                  Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  )
                ],
              ),
              const CustomTitleCategoryProfile(text: "الاسم"),
              CustomTextFormField(
                hintText: "تعديل الاسم",
                onChanged: (value) {
                  herafyName = value;
                },
              ),
              const CustomTitleCategoryProfile(text: "الخبرات"),
              CustomTextFormField(
                hintText: "ادخل خبراتك هنا",
                onChanged: (value) => experiences = value,
              ),
              const CustomTitleCategoryProfile(
                text: "الخدمات المتوفرة",
              ),
              CustomTextFormField(
                hintText: "ادخل الخدمات التي تقدمها",
                onChanged: (value) => availableServices = value,
              ),
              const CustomTitleCategoryProfile(text: "وسيلة التواصل"),
              const CustomTextFormField(hintText: "تغير رقم الهاتف"),
              CustomButton(
                text: "حفظ التغيرات",
                onTap: () async {
                  await addExperience(
                      BlocProvider.of<GetHerafyDataCubit>(context)
                          .herafyModel!
                          .herafyID,
                      experiences!,
                      availableServices!);
                  if (context.mounted) {
                    await BlocProvider.of<GetHerafyDataCubit>(context)
                        .getHerafyDataMethodCubit();
                  }
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> addExperience(
    String? herafyId, String newExperience, String availableServices) async {
  final docRef = FirebaseFirestore.instance.collection('herafy').doc(herafyId);

  await docRef.update({
    'experiences': FieldValue.arrayUnion([newExperience]),
    'availableServices': FieldValue.arrayUnion([availableServices]),
  });
}
