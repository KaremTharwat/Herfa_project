import 'package:flutter/material.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class CustomCategoryHerfa extends StatelessWidget {
  const CustomCategoryHerfa({
    super.key,
   required this.onTap,
   required this.title,
   required this.image,
  });
  final Function() onTap;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(children: [
          SizedBox(
            height: 110,
            width: 150,
            child: ClipRRect(
              borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Color.fromRGBO(217, 217, 217, 0.7),
              ),
              height: 40,
              width: 150,
              child: Center(
                child: CustomText(
                  text: title,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
