import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/user/Auth/user_signup.dart';
import 'package:herfa/presentation/widgets/custom_textformfield.dart';

class CustomDropdownmenuAndtextfield extends StatefulWidget {
  const CustomDropdownmenuAndtextfield({super.key});

  @override
  State<CustomDropdownmenuAndtextfield> createState() => _CustomDropdownmenuAndtextfieldState();
}

class _CustomDropdownmenuAndtextfieldState extends State<CustomDropdownmenuAndtextfield> {
  @override
  Widget build(BuildContext context) {
    return Row(
                    children: [
                      DropdownButton(
                        hint: Text("اختر محافظة"),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        items: listOfGovernorates
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                            validator: (value) {
                              confirmpassord = value;
                              if (value!.isEmpty) {
                                return "الرجاء ادخال اسم المدينة ";
                              }
                              return null;
                            },
                            hintText: "ادخل اسم المدينة التابعة للمحافظة"),
                      )
                    ],
                  );
  }
}