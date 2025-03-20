import 'package:get/get.dart';
import 'package:trash_management/features/authentication/models/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trash_management/features/trash_bank/controllers/deposit_controller.dart';

class UserController extends GetxController {
  late Rx<UserModel> userModel = UserModel(
    id: '',
    email: '',
    username: '',
    desaId: '',
    poin: 0,
  ).obs;

  final GetStorage storage = GetStorage();

  void updateUserModel(Map<String, dynamic> userData, int totalPoin) {
    userModel.value = UserModel.fromJson({
      ...userData,
      'poin': 0,
    });
    refreshUserPoin(userModel.value.id);
  }

  void saveUserToStorage() {
    storage.write('user', userModel.value.toJson());
    storage.write('rememberMe', true);
  }

  void removeUserFromStorage() {
    storage.remove('user');
    storage.write('rememberMe', false);
  }

  Future<int> calculateTotalPoin(String userId) async {
    final DepositController depositController = Get.put(DepositController());
    await depositController.getDeposit(userId: userId);
    return depositController.deposit.fold<int>(
      0,
      (previousValue, element) => previousValue + element.poin,
    );
  }

  Future<void> refreshUserPoin(String userId) async {
    final totalPoin = await calculateTotalPoin(userId);
    userModel.update((user) {
      if (user != null) {
        user.poin = totalPoin;
      }
    });
  }
}
