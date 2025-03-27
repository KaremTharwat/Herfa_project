import 'package:firebase_auth/firebase_auth.dart';

sendResetPassword(email) async {
  return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
