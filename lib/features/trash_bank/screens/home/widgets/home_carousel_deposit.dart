import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:trash_management/features/trash_bank/controllers/home_controller.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_card_deposit_schedule.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeCarouselDeposit extends StatelessWidget {
  const HomeCarouselDeposit({super.key, required this.desaId});

  final String desaId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    controller.setDesaId(desaId);

    return Column(
      children: [
        Obx(
          () => CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: controller.depositSchedule.map((schedule) {
              return DepositScheduleCard(
                waktuMulai: schedule.waktuMulai,
                waktuSelesai: schedule.waktuSelesai,
                desa: controller.desaInformation
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
              for (int i = 0; i < controller.depositSchedule.length; i++)
                REYCircularContainer(
                  width: 20,
                  height: controller.carouselCurrentIndex.value == i ? 6 : 4,
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
