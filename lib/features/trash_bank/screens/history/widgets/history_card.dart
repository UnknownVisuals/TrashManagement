import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/icon_button.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.date,
    required this.name,
    required this.weight,
    required this.type,
    required this.rt,
    required this.rw,
  });

  final String date, name, weight, type, rt, rw;

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        color: REYColors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(REYSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${weight}Kg $type',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'RT$rt/RW$rw',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    REYIconButton(
                      icon: Iconsax.coin_1,
                      title: '180',
                      color: dark ? REYColors.white : REYColors.black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
