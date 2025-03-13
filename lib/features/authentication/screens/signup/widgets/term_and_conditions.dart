import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';
import 'package:trash_management/utils/constants/text_strings.dart';
import 'package:trash_management/features/authentication/controllers/signup_controller.dart';

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());

    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: signupController.agreeTnC.value,
              onChanged: signupController.toggleAgreeToC,
            ),
          ),
          const SizedBox(width: REYSizes.spaceBtwItems),
          Flexible(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${REYTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: REYTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: REYColors.primary,
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
                          color: REYColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: REYColors.primary,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
