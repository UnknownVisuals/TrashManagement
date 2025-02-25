import 'package:get/get.dart';
import 'package:trash_management/features/personalization/models/profile_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  var profile = <ProfileModel>[].obs;
}
