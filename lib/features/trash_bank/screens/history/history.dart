import 'package:flutter/material.dart';
import 'package:trash_management/features/trash_bank/screens/history/widgets/history_card.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/trash_bank/controllers/history_controller.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
    required this.username,
    required this.desaId,
  });

  final String username, desaId;

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());
    controller.fetchHistory(desaId);

    return Obx(
      () => Column(
        spacing: REYSizes.spaceBtwItems,
        children: controller.history
            .where((history) => history.namaPemilik == username)
            .map((filteredHistory) {
          return HistoryCard(
            desaId: filteredHistory.desaId,
            namaPemilik: filteredHistory.namaPemilik,
            berat: filteredHistory.berat,
            jenisSampah: filteredHistory.jenisSampah,
            poin: filteredHistory.poin,
            waktu: filteredHistory.waktu,
            rt: filteredHistory.rt,
            rw: filteredHistory.rw,
          );
        }).toList(),
      ),
    );
  }
}
