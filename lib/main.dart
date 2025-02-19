import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trash_management/app.dart';
import 'package:trash_management/utils/local_storage/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await GetStorage.init();
  Get.put(ThemeController());

  final box = GetStorage();
  bool hasSeenOnboarding = box.read('hasSeenOnboarding') ?? false;

  runApp(App(hasSeenOnboarding: hasSeenOnboarding));
}
