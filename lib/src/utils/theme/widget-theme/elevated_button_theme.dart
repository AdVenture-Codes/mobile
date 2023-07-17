import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TElavatedButtonTheme {
  TElavatedButtonTheme._();
  /*Light theme*/
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: tElevateButtonTextColorL,
      backgroundColor: tElevateButtonColorL,
      side: BorderSide(color: tElevateButtonColorL),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
  /*Dark theme*/
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: tElevateButtonTextColorD,
      backgroundColor: tElevateButtonColorD,
      side: BorderSide(color: tElevateButtonColorD),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
