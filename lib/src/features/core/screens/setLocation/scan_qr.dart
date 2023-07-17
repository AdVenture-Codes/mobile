import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:verse/src/features/core/screens/setLocation/qr_camera.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../../home/screens/home/home_screen.dart';
import '../widget/BarVerse.dart';

class ScanQr extends StatelessWidget {
  const ScanQr({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.04),
              Text(
                tTitleQRSetLocation,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 25,
                    ),
              ),
              SizedBox(height: size.height * 0.05),
              Image(image: AssetImage(tScanQrImage)),
              SizedBox(height: size.height * 0.03),
              Text(
                tSubtitleQRSetLocation,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(),
              ),
              SizedBox(height: size.height * 0.2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.to(UseCurrentLocation());
                    /* navigator?.push(MaterialPageRoute(
                        builder: (context) => UseCurrentLocation()));*/
                    navigator?.push(
                        MaterialPageRoute(builder: (context) => QrCamera()));
                  },
                  child: Text("Continue"),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none, shape: StadiumBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
