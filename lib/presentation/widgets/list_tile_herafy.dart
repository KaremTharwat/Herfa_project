import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/data/models/MaintenanceMan_model/herafy_model.dart';
import 'package:herfa/presentation/views/MaintenanceMan/show_user_profile_herafy.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class ListTileHerafy extends StatelessWidget {
  const ListTileHerafy({
    super.key,
    this.herafyModel,
  });
  final HerafyModel? herafyModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.primaryColorAppbarAndCard,
      child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ShowUserProfileHerafy.routName,
                  arguments: herafyModel
                  );
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "${herafyModel!.imageUrl}"),
              ),
              title:
                  CustomText(text: "${herafyModel!.herafyName}", fontSize: 16),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CustomText(text: "محافظة : القاهرة", fontSize: 12),
                      SizedBox(
                        width: 8,
                      ),
                      CustomText(text: "مدينة : الشروق", fontSize: 12),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: "تقييم العميل 5 من 5",
                        fontSize: 12,
                        color: Color.fromARGB(255, 108, 108, 108),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RatingBarIndicator(
                        itemSize: 20,
                        rating: 5,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
