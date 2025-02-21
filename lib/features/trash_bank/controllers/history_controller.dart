import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trash_management/features/trash_bank/models/history_model.dart';
import 'package:trash_management/utils/http/http_client.dart';

class HistoryController extends GetxController {
  static HistoryController get instance => Get.find();

  var history = <HistoryModel>[].obs;

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy, HH:mm');
    return formatter.format(dateTime);
  }

  void setDesaId(String desaId) {
    fetchHistory(desaId);
  }

  Future<void> fetchHistory(String desaId) async {
    try {
      var historyData = await REYHttpHelper.fetchHistoryDeposit(desaId);
      history.assignAll(historyData);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching history: $e');
      }
    }
  }
}
