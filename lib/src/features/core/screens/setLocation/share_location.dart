import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/features/core/screens/setLocation/use_current_location.dart';
import 'package:verse/src/features/core/screens/widget/BarVerse.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';

class ShareLocation extends StatelessWidget {
  const ShareLocation({super.key});

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
              SizedBox(height: size.height * 0.2),
              Image(image: AssetImage(tLocationImage)),
              SizedBox(height: size.height * 0.05),
              Text(
                tTitleLocationShareLocation,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 25,
                    ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                tSubtitleLocationShareLocation,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(),
              ),
              SizedBox(height: size.height * 0.23),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(UseCurrentLocation());
                    /* navigator?.push(MaterialPageRoute(
                        builder: (context) => UseCurrentLocation()));*/
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
