import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../widget/BarVerse.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: BarVerse(context),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
    );
  }
}
