import 'package:dynamic_appointment/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:dynamic_appointment/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:dynamic_appointment/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
//import 'package:login_flutter_app/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._(); //_ makes the instance private beacuse we
  // we dont wnt user to acess our theme using instance class and here we create a constructor


  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,

  );
}