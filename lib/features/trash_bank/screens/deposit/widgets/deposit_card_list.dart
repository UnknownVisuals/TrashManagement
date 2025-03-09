import 'package:flutter/material.dart';
import 'package:trash_management/features/trash_bank/controllers/history_controller.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/widgets/deposit_card.dart';
import 'package:get/get.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class DepositCardList extends StatelessWidget {
  const DepositCardList({
    super.key,
    required this.userId,
    required this.desaId,
  });

  final String userId, desaId;

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());

    return Obx(
      () => Column(
        spacing: REYSizes.spaceBtwItems,
        children: controller.history
            .where((deposit) => deposit.userId == userId)
            .map((filteredDeposit) {
          return DepositCard(
            desaId: filteredDeposit.desaId,
            berat: filteredDeposit.berat,
            jenisSampah: filteredDeposit.jenisSampah,
            poin: filteredDeposit.poin,
            waktu: filteredDeposit.waktu,
            rt: filteredDeposit.rt,
            rw: filteredDeposit.rw,
            userId: filteredDeposit.userId,
            available: filteredDeposit.available,
          );
        }).toList(),
      ),
    );
  }
}
