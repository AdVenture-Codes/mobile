import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();
  /*Light theme*/
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: tOutlineButtonTextColorL,
      side: BorderSide(color: tOutlineButtonColorL),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
  /*Dark theme*/
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: tOutlineButtonTextColorD,
      side: BorderSide(color: tOutlineButtonColorD),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
