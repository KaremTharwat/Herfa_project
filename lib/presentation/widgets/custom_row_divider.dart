import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 12,
            thickness: 3,
          ),
        ),
        CustomText(
          text: "أو المتابعة بأستخدام",
          fontSize: 18,
          color: ColorsApp.textColorWhite,
        ),
        Expanded(
            child: Divider(
          thickness: 3,
          indent: 12,
        )),
      ],
    );
  }
}
