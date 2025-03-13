import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/authentication/controllers/onboarding_controller.dart';
import 'package:trash_management/features/authentication/screens/onboarding/widgets/onboarding_dot_indicator.dart';
import 'package:trash_management/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:trash_management/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:trash_management/features/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Pages
          PageView(
            controller: OnBoardingController.instance.pageController,
            onPageChanged: OnBoardingController.instance.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: REYImages.onBoardingImage1,
                title: REYTexts.onBoardingTitle1,
                subTitle: REYTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: REYImages.onBoardingImage2,
                title: REYTexts.onBoardingTitle2,
                subTitle: REYTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: REYImages.onBoardingImage3,
                title: REYTexts.onBoardingTitle3,
                subTitle: REYTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkipButton(),

          // Dots Indicator
          const OnBoardingDotIndicator(),

          // Next Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
