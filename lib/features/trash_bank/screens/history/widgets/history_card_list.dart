import 'package:flutter/material.dart';
import 'package:trash_management/features/trash_bank/screens/history/widgets/history_card.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/trash_bank/controllers/history_controller.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HistoryCardList extends StatelessWidget {
  const HistoryCardList({
    super.key,
    required this.userId,
    required this.desaId,
  });

  final String userId, desaId;

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());
    controller.fetchHistory(desaId);

    return Obx(
      () => Column(
        spacing: REYSizes.spaceBtwItems,
        children: controller.history
            .where((history) => history.userId == userId)
            .map((filteredHistory) {
          return HistoryCard(
            desaId: filteredHistory.desaId,
            berat: filteredHistory.berat,
            jenisSampah: filteredHistory.jenisSampah,
            poin: filteredHistory.poin,
            waktu: filteredHistory.waktu,
            rt: filteredHistory.rt,
            rw: filteredHistory.rw,
            userId: filteredHistory.userId,
            available: filteredHistory.available,
          );
        }).toList(),
      ),
    );
  }
}
