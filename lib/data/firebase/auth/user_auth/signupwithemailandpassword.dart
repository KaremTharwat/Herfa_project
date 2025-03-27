import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUpEmailAndPassword(
    email, password, userName, cityName, governorateName) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userCredential.user!.uid)
      .set({
    "email": email,
    "userName": userName,
    "cityName": cityName,
    "governorateName": governorateName,
  });
}
