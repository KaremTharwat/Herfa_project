import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomRowDrawer extends StatelessWidget {
  const CustomRowDrawer({
    super.key,
    required this.text,
    required this.iconData, this.onTap,
  });
  final String text;
  final IconData iconData;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Icon(
              iconData,
              color: ColorsApp.primaryColorAppbarAndCard,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap:onTap ,
            child: CustomText(
              text: text,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
