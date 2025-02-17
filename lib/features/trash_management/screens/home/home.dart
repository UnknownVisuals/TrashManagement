import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:trash_management/features/trash_management/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            REYPrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
