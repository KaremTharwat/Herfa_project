import 'package:flutter/material.dart';

class CustomCircleTogelOnboarding extends StatelessWidget {
  const CustomCircleTogelOnboarding({
    super.key, this.color =Colors.white,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        width: 10,
        height: 10,
      ),
    );
  }
}
