import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUpEmailAndPassword(email, password) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}
