import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSignup()async {
  try {
    await FirebaseAuth.instance.signOut();
    print("removed");
  } catch (e) {
    print("error");
  }

}