import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/authentication/screens/login/login.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: Get.back,
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(REYSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(REYImages.deliveredEmailIllustration),
                width: REYHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                REYTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: REYSizes.spaceBtwItems),
              Text(
                REYTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(const LoginScreen()),
                  child: const Text(REYTexts.rContinue),
                ),
              ),
              const SizedBox(height: REYSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(REYTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
