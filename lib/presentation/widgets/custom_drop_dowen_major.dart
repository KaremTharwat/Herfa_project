import 'package:flutter/material.dart';
import 'package:herfa/presentation/views/MaintenanceMan/auth/herafy_singup.dart';

class CustomDropdownMenuMajor extends StatefulWidget {
  const CustomDropdownMenuMajor({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<CustomDropdownMenuMajor> createState() =>
      _CustomDropdownMenuGovernoratesState();
}

class _CustomDropdownMenuGovernoratesState
    extends State<CustomDropdownMenuMajor> {
  String? selectedValue;
  final List<String> listOfGovernorates = [
    "سباك",
    "كهربائي",
    "نجار",
    "حداد",
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(widget.title),
      value: selectedValue,
      onChanged: (value) {
        major = value;
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
