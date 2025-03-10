import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:trash_management/features/trash_bank/controllers/home_controller.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class DepositTutorialCarousel extends StatelessWidget {
  const DepositTutorialCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    List<Widget> items = [
      Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: REYColors.borderPrimary),
          borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
        ),
        child: Column(
          children: [
            const Flexible(
              flex: 4,
              child: Image(
                image: AssetImage("assets/onboarding/onboarding_1_alt.png"),
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),
            Flexible(
              flex: 1,
              child: Text(
                'Kumpulkan dan pilah sampahmu!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: REYColors.borderPrimary),
          borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
        ),
        child: Column(
          children: [
            const Flexible(
              flex: 4,
              child: Image(
                image: AssetImage("assets/onboarding/onboarding_2_alt.png"),
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),
            Flexible(
              flex: 1,
              child: Text(
                'Bawa sampahmu ke bank sampah terdekat!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: REYColors.borderPrimary),
          borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
        ),
        child: Column(
          children: [
            const Flexible(
              flex: 4,
              child: Image(
                image: AssetImage("assets/onboarding/onboarding_3_alt.png"),
              ),
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),
            Flexible(
              flex: 1,
              child: Text(
                'Tukar sampahmu dan dapatkan poin untuk hadiah menarik!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    ];

    return Obx(
      () => Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1 / 1,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, _) =>
                  homeController.updatePageIndicator(index),
            ),
            items: items,
          ),
          const SizedBox(height: REYSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < items.length; i++)
                REYCircularContainer(
                  width:
                      homeController.carouselCurrentIndex.value == i ? 20 : 16,
                  height:
                      homeController.carouselCurrentIndex.value == i ? 6 : 4,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  backgroundColor:
                      homeController.carouselCurrentIndex.value == i
                          ? REYColors.primary
                          : REYColors.grey,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
