import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/common/widgets/section_heading.dart';
import 'package:trash_management/features/trash_bank/screens/deposit/widgets/deposit_tutorial_carousel.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/trash_bank/controllers/deposit_asus_controller.dart';
import 'package:trash_management/features/trash_bank/models/deposit_asus_model.dart';

class DepositAsusScreen extends StatelessWidget {
  const DepositAsusScreen({
    super.key,
    required this.userId,
    required this.desaId,
  });

  final String userId, desaId;

  @override
  Widget build(BuildContext context) {
    TextEditingController jenisSampahController = TextEditingController();
    TextEditingController beratSampahController = TextEditingController();

    List<Map<String, dynamic>> jenisSampahOptions = [
      {'jenis': 'Plastik', 'poin': 10},
      {'jenis': 'Kertas', 'poin': 5},
      {'jenis': 'Logam', 'poin': 15},
      {'jenis': 'Kaca', 'poin': 20},
    ];

    final DepositAsusController depositAsusController =
        Get.put(DepositAsusController());

    return Scaffold(
      appBar: REYAppBar(
        showBackArrow: true,
        title: Text(
          'Setor Sampah',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(REYSizes.defaultSpace),
        child: Column(
          children: [
            // Tutorial Carousel
            const DepositTutorialCarousel(),
            const SizedBox(height: REYSizes.spaceBtwSections),

            // Deposit List
            const REYSectionHeading(title: 'Setor Sampah'),
            const SizedBox(height: REYSizes.spaceBtwItems),
            Form(
              child: Column(
                children: [
                  // Jenis Sampah
                  DropdownButtonFormField<String>(
                    value: jenisSampahController.text.isEmpty
                        ? null
                        : jenisSampahController.text,
                    items: jenisSampahOptions.map((option) {
                      return DropdownMenuItem<String>(
                        value: option['jenis'],
                        child: Text(option['jenis']),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      jenisSampahController.text = newValue!;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.trash),
                      labelText: 'Jenis Sampah',
                    ),
                  ),

                  const SizedBox(height: REYSizes.spaceBtwInputFields),

                  // Berat Sampah
                  TextFormField(
                    controller: beratSampahController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.weight),
                      labelText: 'Berat Sampah (kg)',
                    ),
                  ),

                  const SizedBox(height: REYSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: REYSizes.spaceBtwItems),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final selectedOption = jenisSampahOptions.firstWhere(
                          (option) =>
                              option['jenis'] == jenisSampahController.text,
                        );
                        final depositAsusModel = DepositAsusModel(
                          desaId: desaId,
                          berat: beratSampahController.text,
                          jenisSampah: jenisSampahController.text,
                          poin: selectedOption['poin'],
                          waktu: DateTime.now(),
                          rt: '00', // Assuming rt is provided elsewhere
                          rw: '00', // Assuming rw is provided elsewhere
                          userId: userId,
                          available: true,
                        );
                        depositAsusController.postDeposit(depositAsusModel);
                      },
                      child: const Text('Submit'),
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
