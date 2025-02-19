import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/features/personalization/screens/profile/profile.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/image_strings.dart';

class REYUserProfileTile extends StatelessWidget {
  const REYUserProfileTile({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  final String userName, userEmail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(REYImages.user, width: 50, height: 50),
      title: Text(
        userName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: REYColors.white),
      ),
      subtitle: Text(
        userEmail,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: REYColors.white),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(const ProfileScreen()),
        icon: const Icon(Iconsax.edit, color: REYColors.white),
      ),
    );
  }
}
