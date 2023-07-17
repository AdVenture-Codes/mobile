import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/images_string.dart';
import '../../../constants/text_string.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPages = 0.obs;

  final pages = [
    onBoardingPageWidget(
      model: OnBoardingModel(
        title: titleOnBording11,
        subTitle: subtitleOnBording12,
        image: tOnBordingImage1,
        bgColor: tOnBoardingpage1Color,
      ),
    ),
    onBoardingPageWidget(
      model: OnBoardingModel(
        title: titleOnBording21,
        subTitle: subtitleOnBording22,
        image: tOnBordingImage2,
        bgColor: tOnBoardingpage2Color,
      ),
    ),
    onBoardingPageWidget(
      model: OnBoardingModel(
        title: titleOnBording31,
        subTitle: subtitleOnBording32,
        image: tOnBordingImage3,
        bgColor: tOnBoardingpage3Color,
      ),
    )
  ];
  OnPageChangeCallback(int activePageIndex) =>
      currentPages.value = activePageIndex;

  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
