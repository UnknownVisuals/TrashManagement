import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trash_management/features/authentication/screens/login/login.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.find();

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => const LoginScreen());
  }
}
