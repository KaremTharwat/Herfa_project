import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/firebase_options.dart';
import 'package:herfa/general_signup.dart';
import 'package:herfa/presentation/views/user/Auth/user_login.dart';
import 'package:herfa/presentation/views/user/Auth/user_signup.dart';
import 'package:herfa/presentation/views/user/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(scaffoldBackgroundColor: ColorsApp.backgroundcolorScreen),
      home:
          Directionality(textDirection: TextDirection.rtl, child: UserSignup()),
      routes: {
        GeneralSignup.generalSignup: (context) => GeneralSignup(),
        HomeScreen.homeScreen: (context) => HomeScreen(),
        UserSignup.userSignup: (context) => UserSignup(),
        UserLogin.userLogin: (context) => UserLogin(),
      },
    );
  }
}
