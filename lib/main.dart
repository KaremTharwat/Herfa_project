import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfa/business%20logic/cubits/user_cubit/get_data_cubit.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/firebase_options.dart';
import 'package:herfa/general_signup.dart';
import 'package:herfa/presentation/views/categories/electrical.dart';
import 'package:herfa/presentation/views/categories/plumber.dart';
import 'package:herfa/presentation/views/onboarding/onboarding_pageview.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_login.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_signup.dart';
import 'package:herfa/presentation/views/categories/home_screen.dart';

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
    return BlocProvider(
      create: (context) => GetDataCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale:const Locale('ar'),
        supportedLocales:const [
          Locale('ar', ''),
          Locale('en', ''),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme:
            ThemeData(scaffoldBackgroundColor: ColorsApp.backgroundcolorScreen),
        home:const UserLogin(),
        routes: {
          GeneralSignup.generalSignup: (context) =>const GeneralSignup(),
          OnboardingPageview.onboarding: (context) => OnboardingPageview(),
          HomeScreen.homeScreen: (context) =>const HomeScreen(),
          UserSignup.userSignup: (context) =>const UserSignup(),
          UserLogin.userLogin: (context) =>const UserLogin(),
          Electrical.electrical: (context) =>const Electrical(),
          Plumber.plumber: (context) =>const Plumber(),
        },
      ),
    );
  }
}
