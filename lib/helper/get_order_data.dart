import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:herfa/data/models/order/order_model.dart';

Future<OrderModel?> getOrderData()async
{
  User? user = FirebaseAuth.instance.currentUser;
  String userId = user!.uid;
   DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('order').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      return OrderModel.fromJson(userDoc.data());
    }else{
      return null;
    }
}