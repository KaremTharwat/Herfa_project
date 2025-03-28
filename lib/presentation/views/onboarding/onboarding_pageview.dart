import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/onboarding/onboarding1.dart';
import 'package:herfa/presentation/views/onboarding/onboarding2.dart';
import 'package:herfa/presentation/views/onboarding/onboarding3.dart';

class OnboardingPageview extends StatelessWidget {
  OnboardingPageview({super.key});
  final PageController nextpage = PageController();
   static const String routName= "/onboarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        reverse: true,
        controller: nextpage,
        children: [
          Onboarding1(
            nextpage: nextpage,
          ),
          Onboarding2(
            nextpage: nextpage,
          ),
         const Onboarding3(),
        ],
      ),
    );
  }
}
