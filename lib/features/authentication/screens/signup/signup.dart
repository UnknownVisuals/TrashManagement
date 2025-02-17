import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/login_signup/form_divider.dart';
import 'package:trash_management/common/widgets/login_signup/social_button.dart';
import 'package:trash_management/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: dark ? REYColors.white : REYColors.black,
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(REYSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                REYTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Form Fields
              const SignupForm(),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Divider
              REYFormDivider(dividerText: REYTexts.orSignUpWith.capitalize!),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Signup with Socials
              const REYSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
