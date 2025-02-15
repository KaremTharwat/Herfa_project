import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/onboarding/onboarding1.dart';
import 'package:herfa/presentation/views/onboarding/onboarding2.dart';
import 'package:herfa/presentation/views/onboarding/onboarding3.dart';

class OnboardingPageview extends StatelessWidget {
  OnboardingPageview({super.key});
  final PageController nextpage = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: nextpage,
        children: [
          Onboarding1(
            nextpage: nextpage,
          ),
          Onboarding2(
            nextpage: nextpage,
          ),
          Onboarding3(),
        ],
      ),
    );
  }
}
