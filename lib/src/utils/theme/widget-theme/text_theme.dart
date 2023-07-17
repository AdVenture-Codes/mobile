import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.mulish(
        fontSize: 55, fontWeight: FontWeight.w500, color: title1BlackColorL),
    headline2: GoogleFonts.dmSans(
        fontSize: 26, fontWeight: FontWeight.w500, color: title1BlackColorL),
    headline3: GoogleFonts.dmSans(
        fontSize: 24, fontWeight: FontWeight.w500, color: title2BlackColorL),
    bodyText1: GoogleFonts.mulish(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: text1GrisColorL.withOpacity(0.8)),
    bodyText2: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: text1GrisColorL.withOpacity(0.8)),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.mulish(
        fontSize: 60, fontWeight: FontWeight.bold, color: titleWhiteColorD),
    headline2: GoogleFonts.dmSans(
        fontSize: 26, fontWeight: FontWeight.w500, color: title1BlackColorD),
    headline3: GoogleFonts.dmSans(
        fontSize: 24, fontWeight: FontWeight.w300, color: title1BlackColorD),
    bodyText1: GoogleFonts.mulish(
        fontSize: 18, fontWeight: FontWeight.w300, color: text1WhiteColorD),
    bodyText2: GoogleFonts.mulish(
        fontSize: 16, fontWeight: FontWeight.w300, color: text1WhiteColorD),
  );
}
