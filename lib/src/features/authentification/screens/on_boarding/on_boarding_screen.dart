import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/images_string.dart';
import '../../../../constants/text_string.dart';
import '../../controllers/on_boarding_controller.dart';
import '../../models/model_on_boarding.dart';
import 'on_boarding_page_widget.dart';

class onBoardingScreen extends StatelessWidget {
  onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        LiquidSwipe(
          pages: obController.pages,
          liquidController: obController.controller,
          slideIconWidget: Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
          onPageChangeCallback: obController.OnPageChangeCallback,
        ),
        Positioned(
          bottom: size.height * 0.08,
          child: OutlinedButton(
            onPressed: () {
              obController.animateToNextSlide();
            },
            style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black),
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                onPrimary: Colors.white),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xff272727),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: TextButton(
            onPressed: () {
              obController.skip();
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Obx(
          () => Positioned(
            bottom: size.height * 0.02,
            child: AnimatedSmoothIndicator(
              activeIndex: obController.currentPages.value,
              count: 3,
              effect: WormEffect(
                activeDotColor: Color(0xff272727),
                dotHeight: 5.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
