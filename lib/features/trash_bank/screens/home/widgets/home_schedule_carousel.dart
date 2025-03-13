import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:trash_management/features/trash_bank/controllers/home_controller.dart';
import 'package:trash_management/features/trash_bank/controllers/schedule_controller.dart';
import 'package:trash_management/features/trash_bank/screens/home/widgets/home_schedule_card.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeScheduleCarousel extends StatelessWidget {
  const HomeScheduleCarousel({super.key, required this.desaId});

  final String desaId;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final ScheduleController scheduleController = Get.put(ScheduleController());

    return Obx(
      () => Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, _) =>
                  homeController.updatePageIndicator(index),
            ),
            items: scheduleController.schedule.map((schedule) {
              String formattedWaktu = scheduleController.formatScheduleTime(
                schedule.waktuMulai,
                schedule.waktuSelesai,
              );

              // TODO: Fix Schedule Card if no schedule available

              return DepositScheduleCard(
                child: schedule.id.isEmpty
                    ? const Center(
                        child: Text('Tidak ada jadwal pengumpulan'),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(REYSizes.defaultSpace),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pengumpulan Sampah',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: REYColors.white),
                            ),
                            const SizedBox(height: REYSizes.sm),
                            Text(
                              '${schedule.hari}, $formattedWaktu WIB',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: REYColors.white),
                            ),
                            const SizedBox(height: REYSizes.sm / 2),
                            Row(
                              children: [
                                const Icon(
                                  Iconsax.location,
                                  size: REYSizes.iconSm,
                                  color: REYColors.white,
                                ),
                                const SizedBox(width: REYSizes.sm / 2),
                                Text(
                                  schedule.desa.nama,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: REYColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              );
            }).toList(),
          ),
          const SizedBox(height: REYSizes.spaceBtwItems),
          Row(
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
        ],
      ),
    );
  }
}
