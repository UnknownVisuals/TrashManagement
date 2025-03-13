import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/styles/spacing_styles.dart';
import 'package:trash_management/common/widgets/login_signup/form_divider.dart';
import 'package:trash_management/common/widgets/login_signup/social_button.dart';
import 'package:trash_management/features/authentication/screens/login/widgets/login_form.dart';
import 'package:trash_management/features/authentication/screens/login/widgets/login_header.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: REYSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // Logo, Title, & Subtitle
            const LoginHeader(),

            // Form Fields
            const LoginForm(),

            // Divider
            REYFormDivider(dividerText: REYTexts.orSignInWith.capitalize!),
            const SizedBox(height: REYSizes.spaceBtwSections),

            // Signin with Socials
            const REYSocialButtons(),
          ],
        ),
      ),
    );
  }
}
