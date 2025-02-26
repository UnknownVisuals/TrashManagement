import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

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
      body: const Center(
        child: Text('Deposit Screen'),
      ),
    );
  }
}
