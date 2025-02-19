import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/authentication/screens/login/login.dart';
import 'package:trash_management/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/utils/local_storage/theme_controller.dart';
import 'package:trash_management/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key, required this.hasSeenOnboarding});

  final bool hasSeenOnboarding;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(
      () => GetMaterialApp(
        title: REYTexts.appName,
        themeMode: themeController.theme,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home:
            hasSeenOnboarding ? const LoginScreen() : const OnBoardingScreen(),
      ),
    );
  }
}
