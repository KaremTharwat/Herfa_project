import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:herfa/data/models/user_model/user_model.dart';

Future<void> addOrderData(UserModel userModel, herafyID)async
{
   await FirebaseFirestore.instance
      .collection('order').add({
        "userID" :userModel.userID,
        "userName" :userModel.userName,
        "herafyID" :herafyID,
        "phoneNumber" :userModel.phoneNumber,
        "governorateName" :userModel.governorateName,
        "cityName" :userModel.cityName,
    
  });
  
}