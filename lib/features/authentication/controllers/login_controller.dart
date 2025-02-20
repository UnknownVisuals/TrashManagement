import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/navigation_menu.dart';
import 'package:trash_management/features/authentication/models/login_model.dart';

class LoginController extends GetxController {
  var obscurePassword = true.obs;
  var rememberMe = false.obs;
  var isLoading = false.obs;

  Future<void> login(String email, String password, String role) async {
    isLoading.value = true;
    try {
      final loginModel = LoginModel(
        email: email,
        password: password,
        role: role,
      );

      // login request
      final response = await REYHttpHelper.login(loginModel.toJson());

      // login response
      if (kDebugMode) {
        print('Login successful: $response');
      }
      final responseUserId = response['user']['id'];
      final responseEmail = response['user']['email'];
      final responseUsername = response['user']['username'];
      final responseDesaId = response['user']['desaId'];

      // Fetch user points from leaderboard API
      try {
        final leaderboardResponse = await REYHttpHelper.get('leaderboard');
        final poin = leaderboardResponse
            .firstWhere((user) => user['id'] == responseUserId)['totalPoin'];
        Get.offAll(
          () => NavigationMenu(
            userId: responseUserId,
            username: responseUsername,
            email: responseEmail,
            desaId: responseDesaId,
            poin: poin,
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print('Failed to load leaderboard data: $e');
        }
        Get.offAll(
          () => NavigationMenu(
            userId: responseUserId,
            username: responseUsername,
            email: responseEmail,
            desaId: responseDesaId,
            poin: 0,
          ),
        );
      }
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
