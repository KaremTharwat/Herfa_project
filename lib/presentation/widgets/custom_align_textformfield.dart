import 'package:flutter/material.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomAlignTextFormField extends StatelessWidget {
  const CustomAlignTextFormField({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomText(
        text: text,
        fontSize: 18,
      ),
    );
  }
}
