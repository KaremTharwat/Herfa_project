import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/general_signup.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_circletogel_onboarding.dart';
import 'package:herfa/presentation/widgets/custom_image_onboarding.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const CustomImageOnbarding(pathImage: ImagesPathApp.image1onboarding3),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration:const BoxDecoration(
                    color: ColorsApp.primaryColorAppbarAndCard,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color:const Color(0xff929292),
                            borderRadius: BorderRadius.circular(30)),
                        width: 60,
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCircleTogelOnboarding(
                              color: Colors.blue,
                            ),
                            CustomCircleTogelOnboarding(),
                            CustomCircleTogelOnboarding(),
                          ],
                        ),
                      ),
                    ),
                  const  CustomText(
                      text: "وفر الوقت و الجهد",
                      fontSize: 28,
                    ),
                   const CustomText(
                      text:
                          " اعثر علي الفني المناسب في ثوانٍ \n ابدا رحلتك مع خدمات حرفية عالية الجودة",
                      fontSize: 14,
                      textAlign: TextAlign.center,
                    ),
                   const CustomText(
                        text: "استمتع بمنزل مرتب و فعال",
                        textAlign: TextAlign.center,
                        fontSize: 24),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 155,
                      child: Stack(children: [
                        Positioned(
                          top: 50,
                          right: 50,
                          child: CustomButton(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, GeneralSignup.routName);
                            },
                            text: "أبدأ الأن",
                          ),
                        ),
                        Positioned(
                          right: 220,
                          bottom: 45,
                          child: Image.asset(
                            ImagesPathApp.image2onboarding3,
                            height: 120,
                          ),
                        ),
                      ]),
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
