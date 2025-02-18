import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/device/device_utility.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class REYAppBar extends StatelessWidget implements PreferredSizeWidget {
  const REYAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: REYSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: dark ? REYColors.white : REYColors.white,
                ),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(REYDeviceUtils.getAppBarHeight());
}
