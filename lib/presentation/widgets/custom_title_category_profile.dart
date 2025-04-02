import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomTitleCategoryProfile extends StatelessWidget {
  const CustomTitleCategoryProfile({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: ColorsApp.buttonsColor,
            borderRadius: BorderRadius.circular(20)),
        child: CustomText(
          text: text,
          fontSize: 18,
          color: ColorsApp.textColorWhite,
        ),
      ),
    );
  }
}
