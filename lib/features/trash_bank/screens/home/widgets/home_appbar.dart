import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/notification/notification_menu_icon.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
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
          ),
        ],
      ),
      actions: [
        REYNotificationCounterIcon(
          onPressed: () {},
          iconColor: REYColors.white,
        ),
      ],
    );
  }
}
