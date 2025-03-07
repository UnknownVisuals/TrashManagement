import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/styles/spacing_styles.dart';
// import 'package:trash_management/common/widgets/login_signup/form_divider.dart';
// import 'package:trash_management/common/widgets/login_signup/social_button.dart';
import 'package:trash_management/features/authentication/screens/login/widgets/login_form.dart';
import 'package:trash_management/features/authentication/screens/login/widgets/login_header.dart';
// import 'package:trash_management/utils/constants/sizes.dart';
// import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/features/authentication/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return const Scaffold(
      body: SingleChildScrollView(
        padding: REYSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // Logo, Title, & Subtitle
            LoginHeader(),

            // Form Fields
            LoginForm(),

            // Divider
            // REYFormDivider(dividerText: REYTexts.orSignInWith.capitalize!),
            // const SizedBox(height: REYSizes.spaceBtwSections),

            // Signin with Socials
            // const REYSocialButtons(),
          ],
        ),
      ),
    );
  }
}
