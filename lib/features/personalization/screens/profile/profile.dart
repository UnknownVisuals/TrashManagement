import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/images/circular_image.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                      child: const Text('Ubah gambar profil'),
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
                value: 'Reynaldhi T. Graha',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Username',
                value: 'reynaldhi3000',
                onPressed: () {},
              ),

              // Divider
              const SizedBox(height: REYSizes.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Personal Info
              const REYSectionHeading(title: 'Informasi pribadi'),
              const SizedBox(height: REYSizes.spaceBtwItems),

              ProfileMenu(
                title: 'Email',
                value: 'reynaldhi@gmail.com',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Nomor Telp.',
                value: '+6285123456789',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'RT',
                value: '003',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'RW',
                value: '006',
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
