import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/fadet_in_animation/animation_design.dart';
import '../../../../common_widgets/fadet_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/fadet_in_animation/fade_in_animation_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../sign_in/sign_in_screen.dart';

class AuthentificationScreen extends StatelessWidget {
  const AuthentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor:
            isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
        body: Stack(
          children: [
            TfadeInAnimation(
              duration: 1000,
              animatePosition: TanimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                topAfter: 0,
                topBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
                leftAfter: 0,
                leftBefore: 0,
              ),
              child: Container(
                padding: EdgeInsets.all(tDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(tAuthImage),
                      height: size.height * 0.5,
                    ),
                    Column(
                      children: [
                        Text(
                          titleAuthentifaction,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 10),
                        Text(
                          subtitleAuthentifaction,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Get.to(SignInScreen());
                            },
                            child: Text("sign in".toUpperCase()),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("sign up".toUpperCase()),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
