import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart%20';

Future<void> userSignOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
  } catch (e) {
    log(e.toString());
  }
}
