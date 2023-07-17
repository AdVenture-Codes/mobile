import 'package:get/get.dart';
import 'package:verse/src/features/core/screens/dashboard/dashboard.dart';
import 'package:verse/src/repository/authentification_repository/authentification_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();
  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const DashboadScreen()) : Get.back();
  }
}
