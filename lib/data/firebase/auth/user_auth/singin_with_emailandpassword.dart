import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInEmailAndPassword(email, password) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email!, password: password!);
}
