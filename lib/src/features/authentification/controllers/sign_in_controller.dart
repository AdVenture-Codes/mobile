import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentification_repository/authentification_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  //Call this Function from Design & it will do the rest
  void loginUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }
}
