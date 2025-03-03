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
        'Yakin mau keluar dari Sobat Sampah?',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () => Get.back(),
          child: const SizedBox(
            width: double.infinity,
            child: Center(child: Text('No')),
          ),
        ),
        const SizedBox(height: REYSizes.spaceBtwItems),
        ElevatedButton(
          onPressed: () {
            controller.logout();
          },
          child: const SizedBox(
            width: double.infinity,
            child: Center(child: Text('Yes')),
          ),
        ),
      ],
    );
  }
}
