import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/widgets/deposit_card_list.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/widgets/deposit_tutorial_carousel.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({
    super.key,
    required this.userId,
    required this.desaId,
  });

  final String userId, desaId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: REYAppBar(
        showBackArrow: true,
        title: Text(
          'Setor Sampah',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(REYSizes.defaultSpace),
        child: Column(
          children: [
            const DepositTutorialCarousel(),
            const SizedBox(height: REYSizes.spaceBtwSections),
            const REYSectionHeading(
              title: 'Menunggu Konfirmasi',
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),
            DepositCardList(userId: userId, desaId: desaId),
          ],
        ),
      ),
    );
  }
}
