import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/features/trash_bank/models/deposit_schedule_model.dart';
import 'package:trash_management/features/trash_bank/models/desa_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  var depositSchedule = <DepositScheduleModel>[].obs;
  var desaInformation = <DesaModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDesaInformation();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  void setDesaId(String desaId) {
    fetchDepositSchedule(desaId);
  }

  void fetchDepositSchedule(String desaId) async {
    try {
      var schedule = await REYHttpHelper.fetchDepositSchedule(desaId);
      depositSchedule.assignAll(schedule);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching deposit schedule: $e');
      }
    }
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy, HH:mm');
    return formatter.format(dateTime);
  }

  void fetchDesaInformation() async {
    try {
      var desaInfo = await REYHttpHelper.fetchDesaInformation();
      desaInformation.assignAll(desaInfo);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching desa information: $e');
      }
    }
  }
}
