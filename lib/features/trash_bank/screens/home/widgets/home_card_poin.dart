import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:trash_management/common/widgets/icon_button.dart';
import 'package:trash_management/features/trash_bank/screens/deposit_asus/deposit_asus.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/features/authentication/controllers/user_controller.dart';

class HomeCardPoin extends StatelessWidget {
  const HomeCardPoin({
    super.key,
    required this.username,
    required this.userId,
    required this.desaId,
  });

  final String username, userId, desaId;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    userController.refreshUserPoin(userId);

    return Obx(() {
      final poin = userController.userModel.value.poin;

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
                        .titleMedium!
                        .copyWith(color: REYColors.white),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp',
                      decimalDigits: 0,
                    ).format(poin),
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: REYColors.white),
                  ),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Iconsax.coin_1,
                  //       size: REYSizes.iconSm,
                  //       color: REYColors.white,
                  //     ),
                  //     const SizedBox(width: REYSizes.sm / 2),
                  //     Text(
                  //       'Poin',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .bodyMedium!
                  //           .copyWith(color: REYColors.white),
                  //     ),
                  //   ],
                  // ),
                ],
              ),

              // Icon Buttons
              Row(
                children: [
                  REYIconButton(
                    icon: Iconsax.send_2,
                    title: 'Setor\nSampah',
                    onPressed: () => Get.to(
                      DepositAsusScreen(
                        username: username,
                        userId: userId,
                        desaId: desaId,
                      ),
                    ),
                  ),
                  // const SizedBox(width: REYSizes.spaceBtwItems),
                  // REYIconButton(
                  //   icon: Iconsax.bitcoin_convert,
                  //   title: 'Tukar\nPoin',
                  //   onPressed: () => Get.to(const PoinExchangeScreen()),
                  // ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
