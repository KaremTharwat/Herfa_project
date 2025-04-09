import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';
import 'package:herfa/presentation/widgets/custom_drawer.dart';
import 'package:herfa/presentation/widgets/custom_search_field.dart';
import 'package:herfa/presentation/widgets/list_tile_herafy.dart';

// ignore: must_be_immutable
class ListOfHerafy extends StatelessWidget {
  static const routName = "ListOfHerafy";
  ListOfHerafy({super.key});
  CollectionReference herafy = FirebaseFirestore.instance.collection('herafy');

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
      body: Column(
        children: [
          const CustomSearchTextField(),
          FutureBuilder<QuerySnapshot>(
              future: herafy.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<HerafyModel?> herafymodelList = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    if(snapshot.data!.docs[i]["major"]==title)
                    {
                        herafymodelList
                        .add(HerafyModel.fromJson(snapshot.data!.docs[i]));
                    }
                  
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: herafymodelList.length,
                      itemBuilder: (context, index) => ListTileHerafy(
                        herafyModel: herafymodelList[index],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
