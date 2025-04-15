import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';
import 'package:herfa/presentation/widgets/custom_app_bar.dart';
import 'package:herfa/presentation/widgets/custom_drawer.dart';
import 'package:herfa/presentation/widgets/custom_search_field.dart';
import 'package:herfa/presentation/widgets/list_tile_herafy.dart';

class ListOfHerafy extends StatefulWidget {
  static const routName = "ListOfHerafy";
  const ListOfHerafy({super.key});

  @override
  State<ListOfHerafy> createState() => _ListOfHerafyState();
}

class _ListOfHerafyState extends State<ListOfHerafy> {
  CollectionReference herafy = FirebaseFirestore.instance.collection('herafy');
  TextEditingController searchController = TextEditingController();
  String searchText = "";
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
          CustomSearchTextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
          FutureBuilder<QuerySnapshot>(
              future: herafy.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<HerafyModel?> herafymodelList = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    if (snapshot.data!.docs[i]["major"] == title) {
                      herafymodelList
                          .add(HerafyModel.fromJson(snapshot.data!.docs[i]));
                    }
                  }
                  List<HerafyModel?> filteredList =
                      herafymodelList.where((herafy) {
                    return herafy!.herafyName!.contains(searchText);
                  }).toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) => ListTileHerafy(
                        herafyModel: filteredList[index],
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
