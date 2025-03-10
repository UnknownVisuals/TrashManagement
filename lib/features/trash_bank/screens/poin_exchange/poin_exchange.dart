import 'package:flutter/material.dart';
import 'package:trash_management/common/widgets/appbar/appbar.dart';
// import 'package:trash_management/utils/constants/colors.dart';
// import 'package:trash_management/utils/constants/sizes.dart';
// import 'package:trash_management/utils/helpers/helper_functions.dart';

class PoinExchangeScreen extends StatelessWidget {
  const PoinExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = REYHelperFunctions.isDarkMode(context);

    return Scaffold(
        appBar: REYAppBar(
          showBackArrow: true,
          title: Text(
            'Tukar Poin',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: const Center(
          child: Text("Tukar Poin belum tersedia"),
        )

        // Container(
        //   width: 180,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(REYSizes.borderRadiusLg),
        //     color: dark
        //         ? REYColors.grey.withValues(alpha: 0.1)
        //         : REYColors.grey.withValues(alpha: 0.6),
        //   ),
        //   child: Column(
        //     children: [
        //       Image(
        //         image: AssetImage("name"),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.all(REYSizes.sm),
        //         child: Column(
        //           children: [
        //             Text(
        //               "Nama Barang",
        //             ),
        //             const SizedBox(
        //               height: REYSizes.spaceBtwItems,
        //             ),
        //             Text(
        //               "Harga",
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
