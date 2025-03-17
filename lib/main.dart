import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:trash_management/controllers/theme_controller.dart';
import 'package:trash_management/features/authentication/models/user_model.dart';
import 'package:trash_management/features/authentication/screens/login/login.dart';
import 'package:trash_management/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trash_management/features/navigation_menu.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController());
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  final GetStorage storage = GetStorage();
  bool seenOnboarding = storage.read('hasSeenOnboarding') ?? false;
  bool rememberMe = storage.read('rememberMe') ?? false;
  final storedUser = storage.read('user');

  runApp(App(
    seenOnboarding: seenOnboarding,
    rememberMe: rememberMe,
    storedUser: storedUser,
  ));
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.seenOnboarding,
    required this.rememberMe,
    required this.storedUser,
  });

  final bool seenOnboarding, rememberMe;
  final Map<String, dynamic>? storedUser;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(
      () => GetMaterialApp(
        title: REYTexts.appName,
        themeMode: themeController.theme,
        theme: REYAppTheme.lightTheme,
        darkTheme: REYAppTheme.darkTheme,
        home: seenOnboarding
            ? (rememberMe && storedUser != null
                ? NavigationMenu(userModel: UserModel.fromJson(storedUser!))
                : const LoginScreen())
            : const OnBoardingScreen(),
      ),
    );
  }
}
