import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:trash_management/controllers/theme_controller.dart';
import 'package:trash_management/features/authentication/screens/login/login.dart';
import 'package:trash_management/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/utils/theme/theme.dart';
import 'package:trash_management/utils/local_storage/storage_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController());
  await dotenv.load(fileName: ".env");
  final localStorage = REYLocalStorage();
  bool seenOnboarding = localStorage.readData('hasSeenOnboarding') ?? false;

  runApp(App(seenOnboarding: seenOnboarding));
}

class App extends StatelessWidget {
  const App({super.key, required this.seenOnboarding});

  final bool seenOnboarding;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(
      () => GetMaterialApp(
        title: REYTexts.appName,
        themeMode: themeController.theme,
        theme: REYAppTheme.lightTheme,
        darkTheme: REYAppTheme.darkTheme,
        home: seenOnboarding ? const LoginScreen() : const OnBoardingScreen(),
      ),
    );
  }
}
