import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';

class PoinExchangeScreen extends StatelessWidget {
  const PoinExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: REYAppBar(
        showBackArrow: true,
        title: Text(
          'Tukar Poin',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Center(
        child: Text('Poin Exchange Screen'),
      ),
    );
  }
}
