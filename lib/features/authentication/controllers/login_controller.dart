import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trash_management/features/authentication/screens/login/login.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/navigation_menu.dart';
import 'package:trash_management/features/authentication/models/login_model.dart';

class LoginController extends GetxController {
  var obscurePassword = true.obs;
  var rememberMe = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLoginState();
  }

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

      // Save login state
      await _saveLoginState(
        responseUserId,
        responseUsername,
        responseEmail,
        responseDesaId,
      );

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

  Future<void> _saveLoginState(
    String userId,
    String username,
    String email,
    String desaId,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userId', userId);
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('desaId', desaId);
    await prefs.setBool('rememberMe', rememberMe.value);
  }

  Future<void> _loadLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    rememberMe.value = prefs.getBool('rememberMe') ?? false;

    if (isLoggedIn) {
      final userId = prefs.getString('userId') ?? '';
      final username = prefs.getString('username') ?? '';
      final email = prefs.getString('email') ?? '';
      final desaId = prefs.getString('desaId') ?? '';

      // Fetch user points from leaderboard API
      try {
        final leaderboardResponse = await REYHttpHelper.get('leaderboard');
        final poin = leaderboardResponse
            .firstWhere((user) => user['id'] == userId)['totalPoin'];
        Get.offAll(
          () => NavigationMenu(
            userId: userId,
            username: username,
            email: email,
            desaId: desaId,
            poin: poin,
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print('Failed to load leaderboard data: $e');
        }
        Get.offAll(
          () => NavigationMenu(
            userId: userId,
            username: username,
            email: email,
            desaId: desaId,
            poin: 0,
          ),
        );
      }
    }
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
    _saveRememberMeState(rememberMe.value);
  }

  Future<void> _saveRememberMeState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => const LoginScreen());
  }
}
