import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/device/device_utility.dart';

class DepositScheduleCard extends StatelessWidget {
  const DepositScheduleCard({
    super.key,
    required this.time,
    required this.location,
  });

  final String time, location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: REYDeviceUtils.getScreenWidth(context),
          height: 180,
          padding: const EdgeInsets.all(REYSizes.defaultSpace),
          margin: const EdgeInsets.symmetric(
            horizontal: REYSizes.spaceBtwItems / 2,
          ),
          decoration: BoxDecoration(
            color: REYColors.primary,
            borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
          ),
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
                time,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
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
                    location,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: REYColors.white),
                  ),
                ],
              ),
            ],
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
            Iconsax.warning_2,
            size: REYSizes.iconLg * 2,
            color: REYColors.white,
          ),
        ),
      ],
    );
  }
}
