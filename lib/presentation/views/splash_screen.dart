import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/views/onboarding/onboarding_pageview.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnboardingPageview()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
            ),
            Text(
              "Herfa",
              style: TextStyle(fontSize: 50, fontFamily: "IrishGrover"),
            )
          ],
        ),
      ),
    );
  }
}
