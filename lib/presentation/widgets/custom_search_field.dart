import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "بحث",
          hintStyle:const TextStyle(fontWeight: FontWeight.bold),
          suffixIcon:const Icon(Icons.search),
          filled: true,
          fillColor: ColorsApp.textColorWhite,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
