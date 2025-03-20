import 'package:flutter/material.dart';
import 'package:herfa/data/models/user_model/user_model.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';

class Electrical extends StatelessWidget {
  //كهربائي
  const Electrical({super.key, this.userModel});
  static const String electrical = "electrical";
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "كهربائي",
      ),
    );
  }
}
