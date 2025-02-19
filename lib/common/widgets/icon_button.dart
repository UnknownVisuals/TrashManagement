import 'package:flutter/material.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

class REYIconButton extends StatelessWidget {
  const REYIconButton({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: REYSizes.iconLg, color: REYColors.white),
        const SizedBox(height: REYSizes.sm),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: REYColors.white),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ],
    );
  }
}
