import 'package:get/get.dart';
import '../../features/authentification/screens/authentification/authentification_screen.dart';
import '../../features/authentification/screens/on_boarding/on_boarding_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;
  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 200));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 2300));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 2000));
    //Get.to(onBoardingScreen());
    Get.offAll(AuthentificationScreen());
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
  }
}
