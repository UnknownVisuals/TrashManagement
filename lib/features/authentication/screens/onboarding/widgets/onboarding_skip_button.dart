import 'package:flutter/material.dart';
import 'package:trash_management/features/authentication/controllers/onboarding_controller.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/device/device_utility.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: REYDeviceUtils.getAppBarHeight(),
      right: REYSizes.defaultSpace,
      child: TextButton(
        onPressed: OnBoardingController.instance.skipPage,
        child: const Text('Skip', style: TextStyle(color: REYColors.primary)),
      ),
    );
  }
}
