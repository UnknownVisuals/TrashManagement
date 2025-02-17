import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:trash_management/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            REYPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  REYAppBar(
                    showBackArrow: false,
                    title: Text(
                      'Akun',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  // Profile Card
                  const REYUserProfileTile(),
                  const SizedBox(height: REYSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(REYSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const REYSectionHeading(
                    title: 'Pengaturan Akun',
                    showActionButton: false,
                  ),
                  const SizedBox(height: REYSizes.spaceBtwItems),
                  const REYSettingsMenuTile(
                    icon: Iconsax.trash,
                    title: 'Riwayat',
                    subTitle: 'Lihat riwayat setor sampah',
                  ),
                  const REYSettingsMenuTile(
                    icon: Iconsax.ranking,
                    title: 'Peringkat',
                    subTitle: 'Lihat peringkat',
                  ),
                  const REYSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Alamat Setor',
                    subTitle: 'Lihat alamat tempat setor sampah',
                  ),

                  // App Settings
                  const SizedBox(height: REYSizes.spaceBtwSections),
                  const REYSectionHeading(
                    title: 'Pengaturan Aplikasi',
                    showActionButton: false,
                  ),
                  const SizedBox(height: REYSizes.spaceBtwItems),
                  REYSettingsMenuTile(
                    icon: Iconsax.moon,
                    title: 'Mode Gelap',
                    subTitle: 'Sesuaikan tampilan dengan cahaya sekitar',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: REYColors.primary,
                    ),
                  ),
                  const SizedBox(height: REYSizes.spaceBtwSections * 2),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: REYSizes.spaceBtwSections * 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class REYSectionHeading extends StatelessWidget {
  const REYSectionHeading({
    super.key,
    this.onPressed,
    this.textColor,
    this.buttonTitle = 'View all',
    required this.title,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
      ],
    );
  }
}
