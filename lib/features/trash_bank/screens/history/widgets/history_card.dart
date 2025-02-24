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
    required this.namaPemilik,
    required this.berat,
    required this.jenisSampah,
    required this.rt,
    required this.rw,
    required this.poin,
    required this.waktu,
  });

  final String desaId, namaPemilik, berat, jenisSampah, rt, rw;
  final int poin;
  final DateTime waktu;

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);
    final formattedDate = DateFormat('dd MMMM yyyy, HH:mm').format(waktu);

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
                Text(
                  namaPemilik,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${berat}Kg $jenisSampah',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // Text(
                //   'RT${rt.padLeft(2, '0')} | RW${rw.padLeft(2, '0')}',
                //   style: Theme.of(context).textTheme.labelSmall,
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                REYIconButton(
                  icon: Iconsax.coin_1,
                  title: poin.toString(),
                  color: dark ? REYColors.white : REYColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
