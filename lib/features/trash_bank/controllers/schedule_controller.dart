import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trash_management/features/trash_bank/models/desa_model.dart';
import 'package:trash_management/features/trash_bank/models/schedule_model.dart';
import 'package:trash_management/utils/http/http_client.dart';

class ScheduleController extends GetxController {
  static ScheduleController get instance => Get.find();

  var schedule = <ScheduleModel>[].obs;
  var desaInformation = <DesaModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDesaInformation();
  }

  String formatDateTime(DateTime dateTime1, DateTime dateTime2) {
    final DateFormat formatter1 = DateFormat('HH:mm');
    final DateFormat formatter2 = DateFormat('HH:mm');
    return '${formatter1.format(dateTime1)} - ${formatter2.format(dateTime2)}';
  }

  void setDesaId(String desaId) {
    fetchSchedule(desaId);
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

  void fetchSchedule(String desaId) async {
    try {
      var scheduleData = await REYHttpHelper.fetchDepositSchedule(desaId);
      schedule.assignAll(scheduleData);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching schedule: $e');
      }
    }
  }
}
