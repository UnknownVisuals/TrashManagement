import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({
    super.key,
    required this.name,
    required this.counts,
    required this.points,
    this.color,
  });

  final String name, counts, points;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);
    final defaultColor = dark
        ? REYColors.grey.withValues(alpha: 0.1)
        : REYColors.grey.withValues(alpha: 0.6);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: REYSizes.spaceBtwItems / 2,
      ),
      child: ListTile(
        leading: Image.asset(REYImages.user, width: 50, height: 50),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          counts,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.coin_15,
              color: REYColors.primary,
              size: REYSizes.iconLg,
            ),
            Text(
              points,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        tileColor: color ?? defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(REYSizes.md),
        ),
      ),
    );
  }
}
