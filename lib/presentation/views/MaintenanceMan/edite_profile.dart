import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';

class EditeProfile extends StatelessWidget {
  const EditeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "تعديل الملف الشخصي"),
      body: Column(
        children: [
            // CircleAvatar(
            //     radius: 80,
            //     backgroundImage: NetworkImage(
            //         "${BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.imageUrl}"),
            //   ),
        ],
      ),
    );
  }
}