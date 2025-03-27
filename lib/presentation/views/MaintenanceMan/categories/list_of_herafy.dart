import 'package:flutter/material.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';
import 'package:herfa/presentation/widgets/custom_drawer.dart';

class ListOfHerafy extends StatelessWidget {
  const ListOfHerafy({super.key});
  static const routName = "ListOfHerafy";

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
      ),
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width - 130,
        child: const CustomDrawer(),
      ),
    );
  }
}
