import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:trash_management/features/trash_bank/controllers/home_controller.dart';
import 'package:trash_management/features/trash_bank/controllers/schedule_controller.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_card_schedule.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeCarouselSchedule extends StatelessWidget {
  const HomeCarouselSchedule({super.key, required this.desaId});

  final String desaId;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final scheduleController = Get.put(ScheduleController());

    scheduleController.setDesaId(desaId);

    return Column(
      children: [
        Obx(
          () => CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              onPageChanged: (index, _) =>
                  homeController.updatePageIndicator(index),
            ),
            items: scheduleController.schedule.map((schedule) {
              return DepositScheduleCard(
                waktuMulai: schedule.waktuMulai,
                waktuSelesai: schedule.waktuSelesai,
                desa: scheduleController.desaInformation
                    .firstWhere((desa) => desa.id == schedule.desaId)
                    .nama,
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: REYSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < scheduleController.schedule.length; i++)
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
        ),
      ],
    );
  }
}
