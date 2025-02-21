import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:trash_management/features/trash_bank/controllers/schedule_controller.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class DepositScheduleCard extends StatelessWidget {
  const DepositScheduleCard({
    super.key,
    required this.waktuMulai,
    required this.waktuSelesai,
    required this.desa,
  });

  final DateTime waktuMulai, waktuSelesai;
  final String desa;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScheduleController());

    String formattedWaktuMulai = controller.formatDateTime(waktuMulai);
    String formattedWaktuSelesai = controller.formatDateTime(waktuSelesai);

    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: REYSizes.spaceBtwItems / 2),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(REYSizes.defaultSpace),
            decoration: BoxDecoration(
              color: REYColors.primary,
              borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
            ),
          ),
          Positioned(
            right: -70,
            bottom: -70,
            child: REYCircularContainer(
              width: 250,
              height: 250,
              backgroundColor: REYColors.white.withValues(alpha: 0.2),
            ),
          ),
          Positioned(
            left: 100,
            bottom: -60,
            child: REYCircularContainer(
              width: 150,
              height: 150,
              backgroundColor: REYColors.white.withValues(alpha: 0.2),
            ),
          ),
          const Positioned(
            right: 30,
            bottom: 40,
            child: Icon(
              Iconsax.clock,
              size: REYSizes.iconLg * 2,
              color: REYColors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(REYSizes.defaultSpace),
            child: Stack(
              children: [
                Column(
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
                      '$formattedWaktuMulai WIB\ns/d\n$formattedWaktuSelesai WIB',
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
                          desa,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: REYColors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
