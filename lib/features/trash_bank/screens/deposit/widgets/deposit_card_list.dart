import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/trash_bank/controllers/deposit_controller.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/widgets/deposit_card.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class DepositCardList extends StatelessWidget {
  const DepositCardList({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    final DepositController controller = Get.put(DepositController());
    controller.getDeposit(userId: userId);

    return Obx(
      () => Column(
        spacing: REYSizes.spaceBtwItems / 2,
        children: controller.deposit.map((deposit) {
          return DepositCard(
            id: deposit.id,
            desaId: deposit.desaId,
            berat: deposit.berat,
            jenisSampah: deposit.jenisSampah,
            poin: deposit.poin,
            waktu: deposit.waktu,
            rt: deposit.rt,
            rw: deposit.rw,
            userId: deposit.userId,
            available: deposit.available,
          );
        }).toList(),
      ),
    );
  }
}
