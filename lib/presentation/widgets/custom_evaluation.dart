import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomEvaluation extends StatelessWidget {
  const CustomEvaluation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: ColorsApp.primaryColorAppbarAndCard,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
                text:
                    "مني جمال : الاثاث رائع جدا و جوده الخشب ممتازة ",
                fontSize: 12),
            RatingBarIndicator(
              itemSize: 20,
              rating: 1,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
