import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/features/leaderboard/screens/widgets/leaderboard_card.dart';
import 'package:trash_management/features/personalization/screens/profile/profile.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/features/leaderboard/controllers/leaderboard_controller.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({
    super.key,
    required this.userId,
    required this.username,
    required this.email,
    required this.desaId,
    required this.poin,
  });

  final String userId, username, email, desaId;
  final int poin;

  @override
  Widget build(BuildContext context) {
    final LeaderboardController controller = Get.put(LeaderboardController());

    return Scaffold(
      appBar: REYAppBar(
        title: const Text('Peringkat'),
        actions: [
          GestureDetector(
            onTap: () => Get.to(const ProfileScreen()),
            child: Image.asset(REYImages.user, width: 40, height: 40),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: REYColors.primary),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(REYSizes.defaultSpace),
            child: Column(
              children: controller.leaderboard.asMap().entries.map((entry) {
                var item = entry.value;
                int index = entry.key;
                Color? color;

                if (index == 0) {
                  color = REYColors.firstPodium;
                } else if (index == 1) {
                  color = REYColors.secondPodium;
                } else if (index == 2) {
                  color = REYColors.thirdPodium;
                }

                return LeaderboardCard(
                  name: item.namaPemilik,
                  counts:
                      'Jumlah pengumpulan: ${item.jumlahPengumpulan.toString().padLeft(2, '0')}',
                  points: item.totalPoin.toString(),
                  color: color,
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
