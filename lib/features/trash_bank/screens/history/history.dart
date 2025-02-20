import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: REYAppBar(),
      body: SingleChildScrollView(),
    );
  }
}
