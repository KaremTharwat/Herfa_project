import 'package:flutter/material.dart';
import 'package:herfa/constans.dart';
import 'package:herfa/presentation/widgets/custom_button.dart';
import 'package:herfa/presentation/widgets/custom_circletogel_onboarding.dart';
import 'package:herfa/presentation/widgets/custom_image_onboarding.dart';
import 'package:herfa/presentation/widgets/custom_text.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key,required this.nextpage});
  final PageController nextpage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        CustomImageOnbarding(
          pathImage: ImagesPathApp.imageOnboarding1,
        ),
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
                        CustomCircleTogelOnboarding(),
                        CustomCircleTogelOnboarding(),
                        CustomCircleTogelOnboarding(
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
               const CustomText(
                  text: "شكرا لاختيارك حِرفة",
                  fontSize: 28,
                ),
               const CustomText(
                  text:
                      "دعنا نساعدك في جعل منزلك افضل \nمع افضل الحرفيين المحترفين في منطقتك ",
                  fontSize: 19,
                  textAlign: TextAlign.center,
                ),
               const CustomText(
                  text: "اطلب حرفي بكل سهولة💛",
                  fontSize: 28,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: "التالي",
                  onTap: () {
                    nextpage.animateToPage(1,
                        duration:const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}
