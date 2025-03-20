import 'package:flutter/material.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';

class Plumber extends StatelessWidget {
  //سباك
  const Plumber({super.key});
  static const plumber = "plumber";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "سباك",
      ),
    );
  }
}
