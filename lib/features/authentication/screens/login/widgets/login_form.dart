import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/features/authentication/screens/password_config/forget_password.dart';
import 'package:trash_management/features/authentication/screens/signup/signup.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/features/authentication/controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: REYSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: REYTexts.email,
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TextFormField(
                controller: passwordController,
                obscureText: loginController.obscurePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: REYTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      loginController.obscurePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: loginController.togglePasswordVisibility,
                  ),
                ),
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwInputFields / 2),

            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: loginController.rememberMe.value,
                        onChanged: loginController.toggleRememberMe,
                      ),
                      const Text(REYTexts.rememberMe),
                    ],
                  ),
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
                onPressed: () {
                  loginController.login(
                    emailController.text,
                    passwordController.text,
                    "WARGA",
                  );
                },
                child: const Text(REYTexts.signIn),
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(const SignupScreen()),
                child: const Text(REYTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
