import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/trash_bank/screens/history/widgets/history_card.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_appbar.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_card_poin.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_carousel_incident.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.username,
    required this.poin,
  });

  final String username;
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
                  HomeAppBar(username: username),
                  const SizedBox(height: REYSizes.spaceBtwSections),
                  HomeCardPoin(poin: poin.toString()),
                  const SizedBox(height: REYSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            // Body
            const Padding(
              padding: EdgeInsets.all(REYSizes.defaultSpace),
              child: Column(
                children: [
                  // Incident Carousel
                  HomeCarouselIncident(),

                  // History
                  Column(
                    children: [
                      REYSectionHeading(
                        title: 'Riwayat',
                        showActionButton: true,
                      ),
                      HistoryCard(
                        date: '12 Februari 2025',
                        name: 'Reynaldhi Tryana Graha',
                        weight: '12',
                        type: 'Kertas',
                        rt: '003',
                        rw: '006',
                      ),
                    ],
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
