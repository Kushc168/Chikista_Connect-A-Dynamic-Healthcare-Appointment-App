import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

/* -- light and dark elevated button themes*/
class TElevatedButtonTheme{
  TElevatedButtonTheme._(); // to avoid creating instance


 /* -- light theme */
static final lightElevatedButtonTheme =ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondaryColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    )
);

  /* --Dark Theme */
static final darkElevatedButtonTheme =ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
     elevation: 0,
     shape: RoundedRectangleBorder(),
     foregroundColor: tSecondaryColor,
     backgroundColor: tWhiteColor,
     side: BorderSide(color: tSecondaryColor),
     padding: EdgeInsets.symmetric(vertical: tButtonHeight),

)
);
}