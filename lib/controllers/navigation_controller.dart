import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/authentication/models/user_model.dart';
import 'package:trash_management/features/news/screens/news.dart';
import 'package:trash_management/features/personalization/screens/settings/settings.dart';
import 'package:trash_management/features/trash_bank/screens/home/home.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  late final List<Widget> screens;
  final UserModel userModel;

  NavigationController({required this.userModel}) {
    screens = [
      HomeScreen(userModel: userModel),
      // LeaderboardScreen(userModel: userModel),
      NewsScreen(userModel: userModel),
      SettingsScreen(userModel: userModel),
    ];
  }
}
