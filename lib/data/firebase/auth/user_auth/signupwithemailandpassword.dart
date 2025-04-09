import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUpEmailAndPasswordUsers(
    email, password, userName, cityName, governorateName,status,phoneNumber) async {
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
    "Status": status,
    "phoneNumber": phoneNumber,
    "userID" :userCredential.user!.uid
  });
}
