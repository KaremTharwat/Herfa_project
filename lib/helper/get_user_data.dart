import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:herfa/data/models/user_model/user_model.dart';
   Future<UserModel?> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user == null)
    {
      null;
    }
    String userId=user!.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      return UserModel.fromJson(userDoc.data());
    }else{
      return null;
    }
  }