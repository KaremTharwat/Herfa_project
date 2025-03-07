import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_circletogel_onboarding.dart';
import 'package:herfa/presentation/widgets/custom_image_onboarding.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key, required this.nextpage});
  static final onboarding2routes = "onboarding2routes";
  final PageController nextpage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomImageOnbarding(pathImage: ImagesPathApp.image1onboarding2),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorsApp.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff929292),
                            borderRadius: BorderRadius.circular(30)),
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCircleTogelOnboarding(),
                            CustomCircleTogelOnboarding(
                              color: Colors.blue,
                            ),
                            CustomCircleTogelOnboarding(),
                          ],
                        ),
                      ),
                    ),
                    CustomText(
                      text: "حرفيون وفنيون متميزون",
                      fontSize: 28,
                    ),
                    CustomText(
                      text: "ضمان جودة الخدمة",
                      fontSize: 19,
                      textAlign: TextAlign.center,
                    ),
                    CustomText(
                        text:
                            "نحن نعمل مع افضل الحرفين المدربين لضمان خدمة عالية الجودة",
                        textAlign: TextAlign.center,
                        fontSize: 24),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: "التالي",
                      onTap: () {
                        nextpage.animateToPage(2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                    ),
                    CustomButton(
                      text: "السابق",
                      onTap: () {
                        nextpage.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
