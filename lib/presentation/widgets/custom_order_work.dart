import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/models/order/order_model.dart';
import 'package:herfa/helper/delete_order.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomOrderWork extends StatelessWidget {
  const CustomOrderWork({
    super.key,
    this.orderModel,
  });
  final OrderModel? orderModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 210,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
              color: ColorsApp.primaryColorAppbarAndCard,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "الاسم :${orderModel!.userName}", fontSize: 18),
              CustomText(
                  text: "المحافظة : ${orderModel!.governorateName}",
                  fontSize: 18),
              CustomText(
                  text: "المدينة : ${orderModel!.cityName}  ", fontSize: 18),
              CustomText(
                  text: "رقم الهاتف : ${orderModel!.phoneNumber}  ",
                  fontSize: 18),
              const CustomText(text: "الدفع : نقدا عند الاصلاح", fontSize: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.buttonsColor),
                      child: const CustomText(
                          text: "قبول",
                          fontSize: 16,
                          color: ColorsApp.textColorWhite)),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: ()  {
                         deleteOrderData(orderModel!.userID,orderModel!.herafyID ,context);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const CustomText(
                        text: "رفض",
                        fontSize: 16,
                        color: ColorsApp.textColorWhite,
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
