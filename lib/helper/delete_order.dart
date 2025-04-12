import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:herfa/helper/showsnackbar.dart';

deleteOrderData(String? userId, herafyID, BuildContext context) async {
  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("order")
        .where('userID', isEqualTo: userId)
        .where('herafyID', isEqualTo: herafyID)
        .get();
    await snapshot.docs.first.reference.delete();
    showSnackBar(context, " تم إلغاء الطلب بنجاح");
  } catch (e) {
    log('Error deleting document: $e');
  }
}
