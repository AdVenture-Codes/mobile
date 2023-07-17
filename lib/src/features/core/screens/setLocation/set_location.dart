import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:verse/src/features/core/screens/setLocation/scan_qr.dart';
import 'package:verse/src/features/core/screens/setLocation/share_location.dart';
import 'package:verse/src/features/core/screens/setLocation/widget/select_option_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../widget/BarVerse.dart';

class SetLocation extends StatelessWidget {
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: BarVerse(context),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Center(
              child: Text(tTitleSetLocation,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
            ),
            SizedBox(height: size.height * 0.025),
            SelectOption(
              image: tQrImage,
              title: tTitleQRSetLocation,
              subtitle: tSubtitleQRSetLocation,
              onPress: () {
                Get.to(ScanQr());
              },
            ),
            SizedBox(height: size.height * 0.04),
            SelectOption(
              image: tLocationImage,
              title: tTitleLocationSetLocation,
              subtitle: tSubtitleLocationSetLocation,
              onPress: () {
                Get.to(ShareLocation());
              },
            ),
          ],
        ),
      )),
    );
  }
}
