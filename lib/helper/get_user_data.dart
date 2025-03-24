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

  //===============================================
  Future<UserModel?> gitUserData() async {
  try {
    // التحقق من تسجيل الدخول
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("⚠️ لا يوجد مستخدم مسجّل دخول");
      return null;
    }

    String userId = user.uid;
    
    // جلب بيانات المستخدم من Firestore
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists && userDoc.data() != null) {
      return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
    } else {
      print("⚠️ المستخدم غير موجود في قاعدة البيانات");
      return null;
    }
  } catch (e) {
    print("❌ خطأ أثناء جلب بيانات المستخدم: $e");
    return null;
  }
}