import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/features/authentication/controllers/onboarding_controller.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/device/device_utility.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);

    return Positioned(
      right: REYSizes.defaultSpace,
      bottom: REYDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: OnBoardingController.instance.nextPage,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? REYColors.primary : REYColors.black,
        ),
        child: const Icon(
          Iconsax.arrow_right_3,
          color: REYColors.white,
        ),
      ),
    );
  }
}
