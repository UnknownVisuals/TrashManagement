import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/features/leaderboard/screens/leaderboard.dart';
import 'package:trash_management/features/news/screens/news.dart';
import 'package:trash_management/features/personalization/screens/settings/settings.dart';
import 'package:trash_management/features/trash_bank/screens/home/home.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    super.key,
    required this.userId,
    required this.email,
    required this.username,
    required this.desaId,
    required this.poin,
  });

  final String userId, email, username, desaId;
  final int poin;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      NavigationController(
        userId: userId,
        username: username,
        email: email,
        desaId: desaId,
        poin: poin,
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
  late final List<Widget> screens;
  final String userId, username, email, desaId;
  final int poin;

  NavigationController({
    required this.userId,
    required this.username,
    required this.email,
    required this.desaId,
    required this.poin,
  }) {
    screens = [
      HomeScreen(
        userId: userId,
        username: username,
        email: email,
        desaId: desaId,
        poin: poin,
      ),
      LeaderboardScreen(
        userId: userId,
        username: username,
        email: email,
        desaId: desaId,
        poin: poin,
      ),
      NewsScreen(
        userId: userId,
        username: username,
        email: email,
        desaId: desaId,
        poin: poin,
      ),
      SettingsScreen(
        userId: userId,
        username: username,
        email: email,
        desaId: desaId,
        poin: poin,
      ),
    ];
  }
}
