import 'package:flutter/material.dart';
import 'package:trash_management/utils/constants/colors.dart';
import 'package:trash_management/utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class REYElevatedButtonTheme {
  REYElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: REYColors.light,
      backgroundColor: REYColors.primary,
      disabledForegroundColor: REYColors.darkGrey,
      disabledBackgroundColor: REYColors.buttonDisabled,
      side: const BorderSide(color: REYColors.primary),
      padding: const EdgeInsets.symmetric(vertical: REYSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: REYColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(REYSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: REYColors.light,
      backgroundColor: REYColors.primary,
      disabledForegroundColor: REYColors.darkGrey,
      disabledBackgroundColor: REYColors.darkerGrey,
      side: const BorderSide(color: REYColors.primary),
      padding: const EdgeInsets.symmetric(vertical: REYSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: REYColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(REYSizes.buttonRadius),
      ),
    ),
  );
}
