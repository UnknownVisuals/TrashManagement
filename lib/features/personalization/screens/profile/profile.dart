import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/images/circular_image.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.username,
    required this.email,
  });

  final String username, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const REYAppBar(
        showBackArrow: true,
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(REYSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const REYCircularImage(
                      image: REYImages.user,
                      width: 100,
                      height: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Ubah gambar profil',
                        style: TextStyle(color: REYColors.primary),
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              const SizedBox(height: REYSizes.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Profile Info
              const REYSectionHeading(title: 'Informasi profil'),
              const SizedBox(height: REYSizes.spaceBtwItems),

              ProfileMenu(
                title: 'Nama',
                value: username,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Email',
                value: email,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Desa',
                value: 'Citereup',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Kecamatan',
                value: 'Dayeuhkolot',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Kabupaten/Kota',
                value: 'Kabupaten Bandung',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
