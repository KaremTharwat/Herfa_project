import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUpEmailAndPasswordHerafy(
  email,
  age,
  password,
  herafyName,
  major,
  imageUrl,
  phonenumber,
  status
) async {
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
    "imageUrl": imageUrl,
    "phoneNumber" : phonenumber,
    "status" : status,
    "herafyID" :userCredential.user!.uid,
    "experiences": [],
    "availableServices": [],
    "rate": 0.0,
    "numberOfResidents": 0,
  });
}
