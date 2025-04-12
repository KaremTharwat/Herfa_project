import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';

    getHerafyData() async {
  User? herafy = FirebaseAuth.instance.currentUser;
  if (herafy == null) {
    null;
  }
  String herafyId = herafy!.uid;
  DocumentSnapshot herafyDoc =
      await FirebaseFirestore.instance.collection('herafy').doc(herafyId).get();

  if (herafyDoc.exists && herafyDoc.data() != null) {
    return HerafyModel.fromJson(herafyDoc.data());
  } else {
    return null;
  }
}