import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trash_management/features/trash_bank/models/deposit_model.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';

class DepositController extends GetxController {
  final REYHttpHelper httpHelper = Get.put(REYHttpHelper());

  RxList<DepositModel> deposit = <DepositModel>[].obs;
  Rx<bool> isLoading = false.obs;

  // GET Pengumpulan Sampah
  Future<void> getDeposit({required String userId}) async {
    isLoading.value = true;

    try {
      final depositResponse = await httpHelper.getRequest(
        '/pengumpulan-sampah/user/$userId',
      );

      final List<dynamic> jsonData = jsonDecode(depositResponse.body);

      deposit.value =
          jsonData.map((data) => DepositModel.fromJson(data)).toList();
    } catch (e) {
      REYLoaders.errorSnackBar(
        title: "Gagal memuat pengumpulan sampah",
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  String formatDepositTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy, HH:mm');
    return formatter.format(dateTime);
  }
}
