import 'package:get/get.dart';
import 'package:trash_management/features/authentication/models/login_model.dart';
import 'package:trash_management/features/authentication/models/user_model.dart';
import 'package:trash_management/features/leaderboard/controllers/leaderboard_controller.dart';
import 'package:trash_management/features/navigation_menu.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final REYHttpHelper httpHelper = Get.put(REYHttpHelper());
  final GetStorage storage = GetStorage();

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

  @override
  void onInit() {
    super.onInit();
    _loadUserFromStorage();
  }

  void _loadUserFromStorage() {
    if (storage.read('rememberMe') == true) {
      final storedUser = storage.read('user');
      if (storedUser != null) {
        userModel.value = UserModel.fromJson(storedUser);
        Get.off(NavigationMenu(userModel: userModel.value));
      }
    }
  }

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

        if (rememberMe.value) {
          storage.write('user', userModel.value.toJson());
          storage.write('rememberMe', true);
        } else {
          storage.remove('user');
          storage.write('rememberMe', false);
        }

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
