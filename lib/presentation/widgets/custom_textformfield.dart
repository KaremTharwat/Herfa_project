import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.iconButton,
    this.textInputType,
    this.onChanged,
  });
  final String hintText;
  final IconButton? iconButton;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        style: const TextStyle(color: ColorsApp.textColorblack),
        cursorColor: ColorsApp.textColorblack,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            suffixIcon: iconButton,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorsApp.buttonsColor))),
      ),
    );
  }
}
