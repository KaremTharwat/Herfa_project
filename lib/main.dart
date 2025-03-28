import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfa/business%20logic/cubits/change_mode_cubit.dart';
import 'package:herfa/business%20logic/cubits/get_data_cubit.dart';
import 'package:herfa/business%20logic/states/change_mode_state.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/firebase_options.dart';
import 'package:herfa/general_signup.dart';
import 'package:herfa/presentation/views/MaintenanceMan/auth/herafy_login.dart';
import 'package:herfa/presentation/views/MaintenanceMan/auth/herafy_singup.dart';
import 'package:herfa/presentation/views/MaintenanceMan/categories/list_of_herafy.dart';
import 'package:herfa/presentation/views/MaintenanceMan/profile_herafy.dart';
import 'package:herfa/presentation/views/onboarding/onboarding_pageview.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_login.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_signup.dart';
import 'package:herfa/presentation/views/user/home_screen.dart';
import 'package:herfa/reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider<GetDataCubit>(
        create: (BuildContext context) => GetDataCubit()),
    BlocProvider<ChangeModeCubit>(
        create: (BuildContext context) => ChangeModeCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ChangeModeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          supportedLocales: const [
            Locale('ar', ''),
            Locale('en', ''),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          darkTheme: BlocProvider.of<ChangeModeCubit>(context).isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsApp.backgroundcolorScreen,
          ),
          home: const HerafySignUp(),
          routes: {
            GeneralSignup.routName: (context) => const GeneralSignup(),
            OnboardingPageview.routName: (context) => OnboardingPageview(),
            HomeScreen.routName: (context) => HomeScreen(),
            UserSignup.routName: (context) => const UserSignup(),
            UserLogin.routName: (context) => const UserLogin(),
            ListOfHerafy.routName: (context) => const ListOfHerafy(),
            ProfileHerafy.routName: (context) => const ProfileHerafy(),
            ResetPassword.routName: (context) => const ResetPassword(),
            HerafyLogin.routName: (context) => const HerafyLogin(),
            HerafySignUp.routName: (context) => const HerafySignUp(),
          },
        );
      },
    );
  }
}
