import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common_widgets/fadet_in_animation/animation_design.dart';
import '../../../../common_widgets/fadet_in_animation/fade_in_animation_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/text_string.dart';
import '../../../../common_widgets/fadet_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      body: SafeArea(
        child: Stack(
          children: [
            TfadeInAnimation(
              duration: 1600,
              animatePosition: TanimatePosition(leftBefore: -50, leftAfter: 0),
              child: const Image(image: AssetImage(tSplashImage1)),
            ),
            TfadeInAnimation(
              duration: 1600,
              animatePosition: TanimatePosition(
                  rightBefore: -50,
                  rightAfter: 0,
                  bottomAfter: 0,
                  bottomBefore: 0),
              child: const Image(image: AssetImage(tSplashImage2)),
            ),
            TfadeInAnimation(
              duration: 1600,
              animatePosition: TanimatePosition(
                  leftBefore: 10,
                  leftAfter: 10,
                  bottomAfter: 80,
                  bottomBefore: -70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tAppName1,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: titleBlackColorL)),
                  Text(
                    tAppName2,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(color: titleOrangeColorL),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
