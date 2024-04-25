import 'package:dynamic_appointment/src/constants/colors.dart';
import 'package:dynamic_appointment/src/constants/sizes.dart';
import 'package:flutter/material.dart';

/* -- light and dark elevated button themes*/
class TOutlinedButtonTheme{
  TOutlinedButtonTheme._(); // to avoid creating instance


  /* -- light theme */
  static final lightOutlinedButtonTheme =OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    )
  );

  /* --Dark Theme */
  static final darkOutlinedButtonTheme =OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: tWhiteColor,
        side: BorderSide(color: tWhiteColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight),
      )
  );
}