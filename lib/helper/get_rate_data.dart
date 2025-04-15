import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:herfa/data/models/rating_model.dart';

Future<RatingModel?> getRateData()async
{
  User? user = FirebaseAuth.instance.currentUser;
  String userId = user!.uid;
   DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('rate').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      return RatingModel.fromJson(userDoc.data());
    }else{
      return null;
    }
}