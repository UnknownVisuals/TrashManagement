import 'package:get/get.dart';
import 'package:trash_management/features/leaderboard/models/leaderboard_model.dart';
import 'package:trash_management/utils/http/http_client.dart';
import 'package:trash_management/utils/popups/loaders.dart';

class LeaderboardController extends GetxController {
  final REYHttpHelper httpHelper = Get.find<REYHttpHelper>();

  RxList<LeaderboardModel> leaderboard = <LeaderboardModel>[].obs;
  Rx<bool> isLoading = false.obs;

  // GET Leaderboard
  Future<void> getLeaderboard() async {
    isLoading.value = true;

    try {
      final leaderboardResponse = await httpHelper.getRequest('leaderboard');

      if (leaderboardResponse.statusCode == 200) {
        final jsonData = leaderboardResponse.body;

        leaderboard.value = (jsonData as List)
            .map((item) => LeaderboardModel.fromJson(item))
            .toList();
      } else {
        REYLoaders.errorSnackBar(
          title: "Gagal memuat peringkat",
          message: "Kesalahan saat memuat data peringkat",
        );
      }
    } catch (e) {
      REYLoaders.errorSnackBar(
        title: "Gagal memuat peringkat",
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
