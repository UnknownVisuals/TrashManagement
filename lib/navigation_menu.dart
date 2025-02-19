import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/features/leaderboard/screens/leaderboard.dart';
import 'package:trash_management/features/news/screens/news.dart';
import 'package:trash_management/features/personalization/screens/settings/settings.dart';
import 'package:trash_management/features/trash_management/screens/home/home.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  final String userName;
  final String userEmail;
  final int userPoints;

  const NavigationMenu({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPoints,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      NavigationController(
        userName: userName,
        userEmail: userEmail,
        userPoints: userPoints,
      ),
    );
    final dark = REYHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => GNav(
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) => controller.selectedIndex.value = index,
          haptic: true,
          gap: 8,
          iconSize: 24,
          tabBorderRadius: 100,
          duration: const Duration(milliseconds: 300),
          color: dark ? REYColors.white : REYColors.darkGrey,
          backgroundColor: dark ? REYColors.black : REYColors.white,
          activeColor: REYColors.primary,
          hoverColor: REYColors.primary.withValues(alpha: 0.2),
          rippleColor: REYColors.primary.withValues(alpha: 0.2),
          tabBackgroundColor: REYColors.primary.withValues(alpha: 0.1),
          tabs: const [
            GButton(icon: Iconsax.home, text: 'Beranda'),
            GButton(icon: Iconsax.award, text: 'Peringkat'),
            GButton(icon: Iconsax.global, text: 'Berita'),
            GButton(icon: Iconsax.user, text: 'Profil'),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final String userName;
  final String userEmail;
  final int userPoints;
  late final List<Widget> screens;

  NavigationController({
    required this.userName,
    required this.userEmail,
    required this.userPoints,
  }) {
    screens = [
      HomeScreen(username: userName, userPoints: userPoints),
      const LeaderboardScreen(),
      const NewsScreen(),
      SettingsScreen(userName: userName, userEmail: userEmail),
    ];
  }
}
