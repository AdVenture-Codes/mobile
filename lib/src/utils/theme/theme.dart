import 'package:flutter/material.dart';
import 'package:verse/src/utils/theme/widget-theme/elevated_button_theme.dart';
import 'package:verse/src/utils/theme/widget-theme/outlined_button_theme.dart';
import 'package:verse/src/utils/theme/widget-theme/text_field_theme.dart';
import 'package:verse/src/utils/theme/widget-theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  //Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    elevatedButtonTheme: TElavatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
//Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
    elevatedButtonTheme: TElavatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
