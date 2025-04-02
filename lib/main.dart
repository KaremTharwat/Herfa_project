import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:herfa/business%20logic/cubits/change_mode_cubit.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/business%20logic/cubits/get_user_data_cubit.dart';
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
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: "https://zsrkhpqqrtgmevlcttpx.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpzcmtocHFxcnRnbWV2bGN0dHB4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMyMTA3MzgsImV4cCI6MjA1ODc4NjczOH0.DMizbeOeOEFubQvYXgejeOI7i2gCgARX5-OXnCanK-A",
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider<GetUserDataCubit>(
        create: (BuildContext context) => GetUserDataCubit()),
    BlocProvider<ChangeModeCubit>(
        create: (BuildContext context) => ChangeModeCubit()),
        BlocProvider<GetHerafyDataCubit>(
        create: (BuildContext context) => GetHerafyDataCubit()),
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
          home: const HerafyLogin(),
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
