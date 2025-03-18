import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:herfa/data/models/user_model/user_model.dart';
   Future<UserModel?> getUserData() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      return UserModel.fromJson(userDoc.data());
    }else{
      return null;
    }
  }