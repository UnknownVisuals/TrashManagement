import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
import 'package:trash_management/utils/constants/image_strings.dart';
import 'package:trash_management/utils/constants/sizes.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(REYSizes.defaultSpace),
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage(REYImages.productsSaleIllustration),
              ),
              Text(
                'Cara Setor Sampah',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
