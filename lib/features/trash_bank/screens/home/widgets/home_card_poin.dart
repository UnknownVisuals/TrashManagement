import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/icon_button.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeCardPoin extends StatelessWidget {
  const HomeCardPoin({
    super.key,
    required this.poin,
  });

  final String poin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: REYSizes.defaultSpace),
      decoration: BoxDecoration(
        color: REYColors.dark.withValues(alpha: 0.2),
        border: Border.all(color: REYColors.white),
        borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(REYSizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Poin Balance
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: REYColors.white),
                ),
                Text(
                  poin,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: REYColors.white),
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.coin_1,
                      size: REYSizes.iconSm,
                      color: REYColors.white,
                    ),
                    const SizedBox(width: REYSizes.sm / 2),
                    Text(
                      'Poin',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: REYColors.white),
                    ),
                  ],
                ),
              ],
            ),

            // Icon Buttons
            const Row(
              children: [
                REYIconButton(
                  icon: Iconsax.send_2,
                  title: 'Setor\nSampah',
                ),
                SizedBox(width: REYSizes.spaceBtwItems),
                REYIconButton(
                  icon: Iconsax.bitcoin_convert,
                  title: 'Tukar\nPoin',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
