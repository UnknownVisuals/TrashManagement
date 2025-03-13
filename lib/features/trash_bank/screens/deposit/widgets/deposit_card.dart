import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:trash_management/common/widgets/icon_button.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/widgets/deposit_confirmation.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class DepositCard extends StatelessWidget {
  const DepositCard({
    super.key,
    required this.id,
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

  final String id, desaId, berat, jenisSampah, rt, rw, userId;
  final int poin;
  final DateTime waktu;
  final bool available;

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);
    final formattedDate = DateFormat('EEEE, dd MMMM yyyy, HH:mm').format(waktu);

    if (!available) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
          border: Border.all(
            color: dark ? REYColors.borderPrimary : REYColors.borderSecondary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(REYSizes.md),
          child: Column(
            children: [
              Row(
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
                      Text(
                        'RT${rt.padLeft(2, '0')}/RW${rw.padLeft(2, '0')}',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
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
              const SizedBox(height: REYSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DepositConfirmationScreen(
                            title: 'Konfirmasi',
                            message: 'Batalkan setor sampah',
                            depositId: id,
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(
                      "Batalkan",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(width: REYSizes.spaceBtwItems),
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DepositConfirmationScreen(
                            title: 'Konfirmasi',
                            message: 'Pastikan semua data sudah benar!',
                            depositId: id,
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(
                      "Konfirmasi",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: REYColors.textWhite),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
