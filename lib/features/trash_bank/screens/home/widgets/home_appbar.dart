import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/notification/notification_menu_icon.dart';
import 'package:trash_management/features/trash_bank/controllers/history_controller.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/deposit.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.username,
    required this.userId,
    required this.desaId,
  });

  final String username, userId, desaId;

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());

    int availableCount = controller.history
        .where(
            (deposit) => deposit.available == false && deposit.userId == userId)
        .length;

    return REYAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            REYTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: REYColors.white),
          ),
          Text(
            'Hello, $username!',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: REYColors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      actions: [
        REYNotificationCounterIcon(
          onPressed: () => Get.to(
            DepositScreen(userId: userId, desaId: desaId),
          ),
          iconColor: REYColors.white,
          availableCount: availableCount,
        ),
      ],
    );
  }
}
