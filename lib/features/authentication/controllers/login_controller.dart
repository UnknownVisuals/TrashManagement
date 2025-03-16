import 'package:get/get.dart';
import 'package:trash_management/features/authentication/models/login_model.dart';
import 'package:trash_management/features/authentication/models/user_model.dart';
import 'package:trash_management/features/leaderboard/controllers/leaderboard_controller.dart';
import 'package:trash_management/features/navigation_menu.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final REYHttpHelper httpHelper = Get.put(REYHttpHelper());

  Rx<bool> isLoading = false.obs;
  Rx<bool> rememberMe = false.obs;
  Rx<bool> obscurePassword = true.obs;

  late Rx<UserModel> userModel = UserModel(
    id: '',
    email: '',
    username: '',
    desaId: '',
    poin: 0,
  ).obs;

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
        final responseBody = loginResponse.body;

        final LeaderboardController leaderboardController = Get.put(
          LeaderboardController(),
        );

        await leaderboardController.getLeaderboard();

        final userLeaderboard = leaderboardController.leaderboard.firstWhere(
          (entry) => entry.userId == responseBody['user']['id'],
        );

        final responsePoin = userLeaderboard.poinSaatIni;

        userModel.value = UserModel.fromJson({
          ...responseBody['user'],
          'poin': responsePoin,
        });

        Get.off(NavigationMenu(userModel: userModel.value));
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
