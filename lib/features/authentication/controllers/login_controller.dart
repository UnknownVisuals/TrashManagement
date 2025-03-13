import 'dart:convert';

import 'package:get/get.dart';
import 'package:trash_management/features/authentication/models/login_model.dart';
import 'package:trash_management/features/leaderboard/controllers/leaderboard_controller.dart';
import 'package:trash_management/features/navigation_menu.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final REYHttpHelper httpHelper = Get.put(REYHttpHelper());

  Rx<bool> isLoading = false.obs;
  Rx<bool> rememberMe = false.obs;
  Rx<bool> obscurePassword = true.obs;

  Future<void> login({
    required String email,
    required String password,
    required String role,
  }) async {
    isLoading.value = true;

    try {
      final loginModel = LoginModel(
        email: email,
        password: password,
        role: role,
      );

      final loginResponse = await httpHelper.postRequest(
        'auth/login',
        loginModel.toJson(),
      );

      if (loginResponse.statusCode == 200) {
        final responseBody = jsonDecode(loginResponse.body);

        final responseUserId = responseBody['user']['id'];
        final responseEmail = responseBody['user']['email'];
        final responseUsername = responseBody['user']['username'];
        final responseDesaId = responseBody['user']['desaId'];

        final LeaderboardController leaderboardController = Get.put(
          LeaderboardController(),
        );

        RxList<dynamic> leaderboard = leaderboardController.leaderboard;

        final userLeaderboard = leaderboard.firstWhere(
          (entry) => entry['userId'] == responseUserId,
          orElse: () => {'poinSaatIni': 0},
        );

        final responsePoin = userLeaderboard['poinSaatIni'];

        REYLoaders.successSnackBar(title: 'Login Berhasil');

        Get.off(
          NavigationMenu(
            userId: responseUserId,
            email: responseEmail,
            username: responseUsername,
            desaId: responseDesaId,
            poin: responsePoin,
          ),
        );
      } else {
        REYLoaders.errorSnackBar(
          title: 'Login Gagal',
          message: "Kesalahan Identitas",
        );
      }
    } catch (e) {
      REYLoaders.errorSnackBar(
        title: 'Login Gagal',
        message: 'Gagal memproses login: ${e.toString()}',
      );
    } finally {
      isLoading.value = false;
    }
  }

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }
}
