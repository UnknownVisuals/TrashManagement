import 'package:get/get.dart';
import 'package:trash_management/features/authentication/models/login_model.dart';
import 'package:trash_management/features/authentication/models/user_model.dart';
import 'package:trash_management/features/navigation_menu.dart';
import 'package:trash_management/features/trash_bank/controllers/deposit_controller.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final REYHttpHelper httpHelper = Get.put(REYHttpHelper());
  final GetStorage storage = GetStorage();

  Rx<bool> isLoading = false.obs;
  Rx<bool> rememberMe = false.obs;
  Rx<bool> obscurePassword = true.obs;

  late Rx<UserModel> userModel;

  @override
  void onInit() {
    super.onInit();
    userModel = UserModel(
      id: '',
      email: '',
      username: '',
      desaId: '',
      poin: 0,
    ).obs;
    Get.put(userModel.value);
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
    print('Login started');

    try {
      final loginModel = LoginModel(
        email: email,
        password: password,
        role: role,
      );
      print('LoginModel created: ${loginModel.toJson()}');

      final loginResponse = await httpHelper.postRequest(
        'auth/login',
        loginModel.toJson(),
      );
      print('Login response received: ${loginResponse.statusCode}');

      if (loginResponse.statusCode == 200) {
        final responseBody = loginResponse.body;
        print('Login successful, response body: $responseBody');

        final DepositController depositController = Get.put(
          DepositController(),
        );
        print('DepositController initialized');

        await depositController.getDeposit(userId: responseBody['user']['id']);
        print('Deposit data fetched');

        final totalPoin = depositController.deposit.fold<int>(
          0,
          (previousValue, element) => previousValue + element.poin,
        );
        print('Total points calculated: $totalPoin');

        userModel.value = UserModel.fromJson({
          ...responseBody['user'],
          'poin': totalPoin,
        });
        print('UserModel updated: ${userModel.value.toJson()}');

        if (rememberMe.value) {
          storage.write('user', userModel.value.toJson());
          storage.write('rememberMe', true);
          print('User data saved to storage');
        } else {
          storage.remove('user');
          storage.write('rememberMe', false);
          print('User data removed from storage');
        }

        Get.off(NavigationMenu(userModel: userModel.value));
        print('Navigation to menu');
      } else {
        print('Login failed with status code: ${loginResponse.statusCode}');
        REYLoaders.errorSnackBar(
          title: 'Login Gagal',
          message: "Kesalahan Identitas",
        );
      }
    } catch (e) {
      print('Exception occurred: ${e.toString()}');
      REYLoaders.errorSnackBar(
        title: 'Login Gagal',
        message: 'Gagal memproses login: ${e.toString()}',
      );
    } finally {
      isLoading.value = false;
      print('Login process ended');
    }
  }

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }
}
