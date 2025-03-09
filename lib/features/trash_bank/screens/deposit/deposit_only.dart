import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/widgets/deposit_card_list.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class DepositOnly extends StatelessWidget {
  const DepositOnly({
    super.key,
    required this.userId,
    required this.desaId,
  });

  final String userId, desaId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: REYAppBar(
        title: Text(
          "Menunggu Konfirmasi",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(REYSizes.defaultSpace),
        child: DepositCardList(userId: userId, desaId: desaId),
      ),
    );
  }
}
