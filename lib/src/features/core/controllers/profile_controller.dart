import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:verse/src/repository/authentification_repository/authentification_repository.dart';

import '../../../repository/user_repository/user_repository.dart';
import '../../authentification/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //Repository
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      print("mail user =${email}");
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUsers();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
