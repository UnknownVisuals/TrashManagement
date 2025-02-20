import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/device/device_utility.dart';

class IncidentCard extends StatelessWidget {
  const IncidentCard({
    super.key,
    required this.incident,
    required this.location,
  });

  final String incident, location;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: REYDeviceUtils.getScreenWidth(context),
      height: 180,
      padding: const EdgeInsets.all(REYSizes.defaultSpace),
      margin:
          const EdgeInsets.symmetric(horizontal: REYSizes.spaceBtwItems / 2),
      decoration: BoxDecoration(
        color: REYColors.primary,
        borderRadius: BorderRadius.circular(
          REYSizes.borderRadiusLg,
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Insiden',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: REYColors.white),
              ),
              const SizedBox(height: REYSizes.sm),
              Text(
                incident,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
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
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Iconsax.warning_2,
                  size: REYSizes.iconLg * 2,
                  color: REYColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
