import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/features/trash_bank/controllers/schedule_controller.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key, required this.desaId});

  final String desaId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScheduleController());
    final schedule = controller.schedule.firstWhere(
      (schedule) => schedule.desaId == desaId,
    );

    return Scaffold(
      appBar: REYAppBar(
        showBackArrow: true,
        title: Text(
          'Riwayat',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(REYSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.location,
              color: REYColors.primary,
              size: REYSizes.iconLg * 2,
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),
            Text(
              "Kumpulkan sampahmu di",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: REYSizes.spaceBtwItems),
            Text(
              '${schedule.desa.nama}, ${schedule.desa.kecamatan}, ${schedule.desa.kabupaten}, ${schedule.desa.provinsi}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
