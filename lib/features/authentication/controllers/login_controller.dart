import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/navigation_menu.dart';
import 'package:trash_management/features/authentication/models/login_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var obscurePassword = true.obs;
  var rememberMe = false.obs;

  Future<void> login(String email, String password, String role) async {
    isLoading.value = true;
    try {
      final loginModel = LoginModel(
        email: email,
        password: password,
        role: role,
      );
      final response = await REYHttpHelper.login(loginModel.toJson());
      if (kDebugMode) {
        print('Login successful: $response');
      }
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      if (kDebugMode) {
        print('Login failed: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }
}
