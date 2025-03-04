import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/features/authentication/controllers/logout_controller.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogoutController());

    return AlertDialog(
      title: Center(
        child: Text(
          'Keluar',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      content: Text(
        'Yakin mau keluar Sobat Sampah?',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                child: const Center(child: Text('No')),
              ),
            ),
            const SizedBox(width: REYSizes.spaceBtwItems),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.logout();
                },
                child: const Center(child: Text('Yes')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
