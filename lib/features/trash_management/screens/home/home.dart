import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/common/widgets/icon_button.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_appbar.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_card_poin.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_carousel_incident.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required this.username, required this.userPoints});

  final String username;
  final int userPoints;

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
                  HomeCardPoin(poin: userPoints.toString()),
                  const SizedBox(height: REYSizes.spaceBtwSections * 2),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(REYSizes.defaultSpace),
              child: Column(
                children: [
                  // Incident Carousel
                  const HomeCarouselIncident(),

                  // History
                  const REYSectionHeading(
                    title: 'Riwayat',
                    showActionButton: true,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: REYColors.grey,
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          BorderRadius.circular(REYSizes.borderRadiusLg),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(REYSizes.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12 Februari 2025',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reynaldhi T. Graha',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    '12 Kg | Kertas',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'RT02 / RW03',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                              const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  REYIconButton(
                                    icon: Iconsax.coin,
                                    title: '180',
                                    color: REYColors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
