import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/trash_bank/screens/history/history.dart';
import 'package:trash_management/features/trash_bank/screens/history/widgets/history_card_list.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_appbar.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_card_poin.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_schedule_carousel.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            REYPrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(
                    username: username,
                    userId: userId,
                    desaId: desaId,
                  ),
                  const SizedBox(height: REYSizes.spaceBtwSections),
                  HomeCardPoin(
                    poin: poin.toString(),
                    userId: userId,
                    desaId: desaId,
                  ),
                  const SizedBox(height: REYSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(REYSizes.defaultSpace),
              child: Column(
                children: [
                  // Schedule Carousel
                  HomeScheduleCarousel(desaId: desaId),

                  // History
                  REYSectionHeading(
                    title: 'Riwayat',
                    showActionButton: true,
                    onPressed: () => Get.to(
                      HistoryScreen(userId: userId, desaId: desaId),
                    ),
                  ),
                  SingleChildScrollView(
                    child: HistoryCardList(userId: userId, desaId: desaId),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
