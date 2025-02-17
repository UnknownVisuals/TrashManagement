import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trash_management/features/authentication/controllers/onboarding_controller.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/device/device_utility.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class OnBoardingDotIndicator extends StatelessWidget {
  const OnBoardingDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = REYHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: REYDeviceUtils.getBottomNavigationBarHeight() + 24,
      left: REYSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? REYColors.light : REYColors.dark,
          dotHeight: 8,
        ),
      ),
    );
  }
}
