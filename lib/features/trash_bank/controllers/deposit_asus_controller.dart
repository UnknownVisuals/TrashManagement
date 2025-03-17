import 'package:get/get.dart';
import 'package:trash_management/features/trash_bank/models/deposit_asus_model.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';

class DepositAsusController extends GetxController {
  final REYHttpHelper httpHelper = Get.put(REYHttpHelper());

  RxList<DepositAsusModel> deposit = <DepositAsusModel>[].obs;
  Rx<bool> isLoading = false.obs;

  // POST Deposit Asus
  Future<void> postDeposit(DepositAsusModel depositAsusModel) async {
    isLoading.value = true;

    try {
      final response = await httpHelper.postRequest(
        'pengumpulan-sampah',
        depositAsusModel.toJson(),
      );

      if (response.statusCode == 200) {
        REYLoaders.successSnackBar(
          title: "Sukses menyetor sampah",
          message: "Data sampah berhasil disetor",
        );
      } else {
        REYLoaders.errorSnackBar(
          title: "Gagal menyetor sampah",
          message: "Terjadi kesalahan saat menyetor sampah",
        );
      }
    } catch (e) {
      REYLoaders.errorSnackBar(
        title: "Gagal menyetor sampah",
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
