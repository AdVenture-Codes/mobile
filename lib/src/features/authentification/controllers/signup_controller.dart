import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/features/authentification/models/user_model.dart';
import 'package:verse/src/features/authentification/screens/welcome/welcome_screen.dart';
import 'package:verse/src/repository/user_repository/user_repository.dart';

import '../../../repository/authentification_repository/authentification_repository.dart';
import '../screens/forget_password/forget_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNum = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  void phoneAuthentification(String phoneNum) {
    AuthenticationRepository.instance.phoneAuthentification(phoneNum);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    Get.to(WelcomeScreen());
    //phoneAuthentification(user.phoneNum);
    //Get.to(OTPScreen());
  }
}
