import 'package:get/get.dart';
import 'package:trash_management/features/authentication/screens/login/login.dart';

class LogoutController extends GetxController {
  Future<void> logout() async {
    Get.offAll(() => const LoginScreen());
  }
}
