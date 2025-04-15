import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:herfa/data/models/user_model/user_model.dart';

Future<void> addRateData(UserModel? userModel,String? herafyID ,String evaluationText, double rate)async
{
   await FirebaseFirestore.instance
      .collection('rate').add({
        "userID" :userModel!.userID,
        "herafyID" :herafyID,
        "evaluationText" :evaluationText,
        "rate" :rate,
        "userName":userModel.userName 
    
  });
  
}