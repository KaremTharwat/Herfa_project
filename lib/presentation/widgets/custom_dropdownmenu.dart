import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/MaintenanceMan/auth/herafy_singup.dart';
import 'package:herfa/presentation/views/user/Auth_views/user_signup.dart';

class CustomDropdownMenuGovernorates extends StatefulWidget {
  const CustomDropdownMenuGovernorates({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<CustomDropdownMenuGovernorates> createState() =>
      _CustomDropdownMenuGovernoratesState();
}

class _CustomDropdownMenuGovernoratesState
    extends State<CustomDropdownMenuGovernorates> {
  String? selectedValue;
  final List<String> listOfGovernorates = [
    "القاهرة",
    "الجيزة",
    "القليوبية",
    "الشرقية",
    "المنوفية"
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(widget.title),
      value: selectedValue,
      onChanged: (value) {
        governorateName = value;
        setState(() {
          selectedValue = value;
        });
      },
      items: listOfGovernorates.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
