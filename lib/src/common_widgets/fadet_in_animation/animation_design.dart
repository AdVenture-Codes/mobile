import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';

class TfadeInAnimation extends StatelessWidget {
  TfadeInAnimation({
    super.key,
    required this.duration,
    required this.animatePosition,
    required this.child,
  });

  final controller = Get.put(FadeInAnimationController());
  final int duration;
  final TanimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: duration),
        top: controller.animate.value
            ? animatePosition!.topAfter
            : animatePosition!.topBefore,
        left: controller.animate.value
            ? animatePosition!.leftAfter
            : animatePosition!.leftBefore,
        right: controller.animate.value
            ? animatePosition!.rightAfter
            : animatePosition!.rightBefore,
        bottom: controller.animate.value
            ? animatePosition!.bottomAfter
            : animatePosition!.bottomBefore,
        child: AnimatedOpacity(
          opacity: controller.animate.value ? 1 : 0,
          duration: Duration(milliseconds: duration),
          child: child,
        ),
      ),
    );
  }
}
