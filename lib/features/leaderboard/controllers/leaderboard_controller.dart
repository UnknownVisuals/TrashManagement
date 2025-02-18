import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/leaderboard/models/leaderboard_model.dart';
import 'package:trash_management/utils/http/http_client.dart';

class LeaderboardController extends GetxController {
  var leaderboard = <LeaderboardModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchLeaderboard();
    super.onInit();
  }

  void fetchLeaderboard() async {
    try {
      isLoading(true);
      final response = await REYHttpHelper.get('leaderboard');
      leaderboard.value = (response as List)
          .map((data) => LeaderboardModel.fromJson(data))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching leaderboard: $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
