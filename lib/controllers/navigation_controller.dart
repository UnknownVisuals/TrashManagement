import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/leaderboard/screens/leaderboard.dart';
import 'package:trash_management/features/news/screens/news.dart';
import 'package:trash_management/features/personalization/screens/settings/settings.dart';
import 'package:trash_management/features/trash_bank/screens/home/home.dart';

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
