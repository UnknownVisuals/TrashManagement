import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/authentication/models/user_model.dart';
import 'package:trash_management/features/trash_bank/screens/history/history.dart';
import 'package:trash_management/features/trash_bank/screens/history/widgets/history_card_list.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_appbar.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_card_poin.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_schedule_carousel.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userModel});

  final UserModel userModel;

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
                    username: userModel.username,
                    userId: userModel.id,
                    desaId: userModel.desaId,
                  ),
                  const SizedBox(height: REYSizes.spaceBtwSections),
                  HomeCardPoin(
                    username: userModel.username,
                    poin: userModel.poin.toString(),
                    userId: userModel.id,
                    desaId: userModel.desaId,
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
                  HomeScheduleCarousel(desaId: userModel.desaId),

                  // History
                  REYSectionHeading(
                    title: 'Riwayat',
                    showActionButton: true,
                    onPressed: () => Get.to(
                      HistoryScreen(
                        userId: userModel.id,
                        desaId: userModel.desaId,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: HistoryCardList(userId: userModel.id),
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
