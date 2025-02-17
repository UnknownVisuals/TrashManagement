import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/features/authentication/screens/password_config/forget_password.dart';
import 'package:trash_management/features/authentication/screens/signup/signup.dart';
import 'package:trash_management/navigation_menu.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: REYSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: REYTexts.email,
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: REYTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwInputFields / 2),

            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(REYTexts.rememberMe),
                  ],
                ),

                // Forgot Password
                TextButton(
                  onPressed: () => Get.to(const ForgetPasswordScreen()),
                  child: const Text(REYTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: REYSizes.spaceBtwSections),

            // Signin Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(const NavigationMenu()),
                child: const Text(REYTexts.signIn),
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(const SignupScreen());
                },
                child: const Text(REYTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
