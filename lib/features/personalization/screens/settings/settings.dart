import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:trash_management/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/authentication/screens/logout/logout.dart';
import 'package:trash_management/features/personalization/screens/settings/address.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/deposit_only.dart';
import 'package:trash_management/features/trash_bank/screens/history/history.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/local_storage/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.userId,
    required this.username,
    required this.email,
    required this.desaId,
    required this.poin,
  });

  final String userId, username, email, desaId;
  final int poin;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

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
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: REYColors.white),
                    ),
                  ),

                  // Profile Card
                  REYUserProfileTile(
                    username: username,
                    email: email,
                    desaId: desaId,
                  ),
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
                  REYSettingsMenuTile(
                    icon: Iconsax.receipt,
                    title: 'Riwayat',
                    subTitle: 'Lihat riwayat setor sampah',
                    onTap: () => Get.to(
                      HistoryScreen(userId: userId, desaId: desaId),
                    ),
                  ),
                  REYSettingsMenuTile(
                    icon: Iconsax.check,
                    title: 'Konfirmasi',
                    subTitle: 'Konfirmasi setor sampah',
                    onTap: () => Get.to(
                      DepositOnly(userId: userId, desaId: desaId),
                    ),
                  ),
                  REYSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Alamat Setor',
                    subTitle: 'Lihat alamat tempat setor sampah',
                    onTap: () => Get.to(
                      AddressScreen(desaId: desaId),
                    ),
                  ),

                  // App Settings
                  const SizedBox(height: REYSizes.spaceBtwSections),
                  const REYSectionHeading(
                    title: 'Pengaturan Aplikasi',
                    showActionButton: false,
                  ),
                  const SizedBox(height: REYSizes.spaceBtwItems),
                  Obx(() {
                    bool isDark = themeController.isDarkMode.value;

                    return REYSettingsMenuTile(
                      icon: Iconsax.moon,
                      title: 'Mode Gelap',
                      subTitle: 'Sesuaikan tampilan dengan cahaya sekitar',
                      trailing: Switch(
                        value: isDark,
                        onChanged: (value) {
                          themeController.toggleTheme(value);
                        },
                        activeColor: REYColors.primary,
                      ),
                    );
                  }),

                  const SizedBox(height: REYSizes.spaceBtwSections * 2),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const LogoutScreen();
                          },
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
