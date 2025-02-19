import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_appbar.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_card_poin.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
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
            const Padding(
              padding: EdgeInsets.all(REYSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Carousel
                  REYRoundedImage(),
                  // History
                  REYSectionHeading(title: 'Riwayat', showActionButton: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class REYRoundedImage extends StatelessWidget {
  const REYRoundedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
        child: const Image(
          image: AssetImage(REYImages.promoBanner1),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
