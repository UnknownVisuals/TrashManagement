import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trash_management/features/trash_bank/models/deposit_model.dart';
import 'package:trash_management/utils/http/http_client.dart';

class DepositController extends GetxController {
  static DepositController get instance => Get.find();

  var deposit = <DepositModel>[].obs;

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy, HH:mm');
    return formatter.format(dateTime);
  }

  Future<void> fetchDeposit(String userId) async {
    try {
      var depositData = await REYHttpHelper.fetchDeposit(userId);
      deposit.assignAll(depositData);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Deposit: $e');
      }
    }
  }

  Future<void> confirmDeposit(String userId, String depositId) async {
    try {
      var depositData = await REYHttpHelper.fetchDeposit(userId);
      var depositToConfirm =
          depositData.firstWhere((deposit) => deposit.id == depositId);
      await REYHttpHelper.confirmDeposit(depositToConfirm, userId);
      deposit.assignAll(await REYHttpHelper.fetchDeposit(userId));
    } catch (e) {
      if (kDebugMode) {
        print('Error confirming Deposit: $e');
      }
    }
  }
}
