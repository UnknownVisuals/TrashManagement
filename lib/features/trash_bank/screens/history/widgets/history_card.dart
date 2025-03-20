import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/icon_button.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.desaId,
    required this.berat,
    required this.jenisSampah,
    required this.rt,
    required this.rw,
    required this.poin,
    required this.waktu,
    required this.userId,
    required this.available,
  });

  final String desaId, berat, jenisSampah, rt, rw, userId;
  final int poin;
  final DateTime waktu;
  final bool available;

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);
    final formattedDate = DateFormat('EEEE, dd MMMM yyyy, HH:mm').format(waktu);

    if (!available) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: dark
            ? REYColors.grey.withValues(alpha: 0.1)
            : REYColors.grey.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(REYSizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$formattedDate WIB',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: REYSizes.spaceBtwItems / 4),
                Text(
                  '${berat}Kg $jenisSampah',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: REYSizes.spaceBtwItems / 4),
                Text(
                  'Rp $poin',
                  // 'RT${rt.padLeft(2, '0')}/RW${rw.padLeft(2, '0')}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                REYIconButton(
                  icon: Iconsax.archive_add,
                  title: '',
                  color: dark ? REYColors.lightGrey : REYColors.darkGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
