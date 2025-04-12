
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herfa/business%20logic/cubits/get_herafy_data.dart';
import 'package:herfa/data/models/order/order_model.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';
import 'package:herfa/presentation/widgets/custom_order_work.dart';

// ignore: must_be_immutable
class ServiceRequestNotification extends StatelessWidget {
   ServiceRequestNotification({super.key, });
  static const routName = "serviceRequestNotification";
  Stream<QuerySnapshot> order = FirebaseFirestore.instance.collection('order').snapshots();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const CustomAppBar(
        title: "إشعار طلب خدمة",
      ),
      body: SafeArea(
         child: StreamBuilder<QuerySnapshot>(
              stream: order,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<OrderModel?> orderList = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                 if(snapshot.data!.docs[i]["herafyID"] == BlocProvider.of<GetHerafyDataCubit>(context).herafyModel!.herafyID)
                 {
                   orderList
                        .add(OrderModel.fromJson(snapshot.data!.docs[i]));
                 }
                  }
                  return ListView.builder(
                    itemCount: orderList.length,
                    itemBuilder: (context, index) => CustomOrderWork(
                      orderModel: orderList[index],
                    ),
                  );
                } else {
                  return const Center(child:CircularProgressIndicator());
                }
              })
      ),
    );
  }
}