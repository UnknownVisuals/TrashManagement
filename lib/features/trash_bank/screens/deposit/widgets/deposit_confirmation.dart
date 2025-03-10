import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/trash_bank/controllers/deposit_controller.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class DepositConfirmationScreen extends StatelessWidget {
  const DepositConfirmationScreen({
    super.key,
    required this.title,
    required this.message,
    required this.userId,
    required this.depositId,
    required this.leaderboardId,
  });

  final String title, message, userId, depositId, leaderboardId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DepositController());

    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                child: const Center(child: Text('Tidak')),
              ),
            ),
            const SizedBox(width: REYSizes.spaceBtwItems),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.confirmDeposit(userId, depositId);
                },
                child: const Center(child: Text('Iya')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
