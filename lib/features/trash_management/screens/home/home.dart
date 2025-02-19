import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_appbar.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            REYPrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SizedBox(height: REYSizes.spaceBtwSections),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: REYSizes.defaultSpace),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        REYSizes.borderRadiusLg,
                      ),
                      color: REYColors.dark.withValues(alpha: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: REYColors.dark.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(
                        color: REYColors.white.withValues(alpha: 0.4),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(REYSizes.borderRadiusLg),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(REYSizes.defaultSpace),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Saldo',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: REYColors.white),
                                  ),
                                  Text(
                                    '5000',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(color: REYColors.white),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Iconsax.coin_1,
                                        size: REYSizes.iconSm,
                                        color: REYColors.white,
                                      ),
                                      const SizedBox(width: REYSizes.sm / 2),
                                      Text(
                                        'Poin',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: REYColors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      const Icon(
                                        Iconsax.send_2,
                                        size: REYSizes.iconLg,
                                        color: REYColors.white,
                                      ),
                                      const SizedBox(height: REYSizes.sm),
                                      Text(
                                        'Setor\nSampah',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: REYColors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: REYSizes.spaceBtwItems),
                                  Column(
                                    children: [
                                      const Icon(
                                        Iconsax.bitcoin_convert,
                                        size: REYSizes.iconLg,
                                        color: REYColors.white,
                                      ),
                                      const SizedBox(height: REYSizes.sm),
                                      Text(
                                        'Tukar\nPoin',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: REYColors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
