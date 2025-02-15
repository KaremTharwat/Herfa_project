import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/auth/general_signup.dart';
import 'package:herfa/presentation/views/onboarding/onboarding1.dart';
import 'package:herfa/presentation/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: SplashScreen(),
      ),
      routes: {
        GeneralSignup.generalSignup : (context)=>GeneralSignup(),
      },
    );
  }
}
