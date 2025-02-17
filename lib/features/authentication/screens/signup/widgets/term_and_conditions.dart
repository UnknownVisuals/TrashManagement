import 'package:flutter/material.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/utils/helpers/helper_functions.dart';

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = REYHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        const SizedBox(width: REYSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${REYTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: REYTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? REYColors.primary : REYColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: REYColors.primary,
                    ),
              ),
              TextSpan(
                text: ' ${REYTexts.and} ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: REYTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? REYColors.primary : REYColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: REYColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
