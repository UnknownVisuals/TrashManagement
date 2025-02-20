import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:trash_management/features/trash_management/controllers/home_controller.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_card_incident.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeCarouselIncident extends StatelessWidget {
  const HomeCarouselIncident({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: const [
            IncidentCard(
              incident: 'TPS Kebakaran',
              location: 'Sukapura',
            ),
            IncidentCard(
              incident: 'TPS Penuh',
              location: 'Mengger',
            ),
            IncidentCard(
              incident: 'TPS Banjir',
              location: 'Sukabirus',
            ),
          ],
        ),
        const SizedBox(height: REYSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                REYCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? REYColors.primary
                      : REYColors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
