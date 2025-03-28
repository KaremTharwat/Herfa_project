import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUpEmailAndPasswordHerafy(
    email,age , password, herafyName,major,) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
  await FirebaseFirestore.instance
      .collection('herafy')
      .doc(userCredential.user!.uid)
      .set({
    "email": email,
    "herafyName": herafyName,
    "age": age,
    "major": major,
  });
}