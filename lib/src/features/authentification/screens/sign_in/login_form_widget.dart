import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../controllers/sign_in_controller.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  //labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: tFormHeight),
            TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                //labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: Text(tForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    SignInController.instance.loginUser(
                        controller.email.text.trim(),
                        controller.password.text.trim());
                  },
                  child: Text(tSignIn)),
            )
          ],
        ),
      ),
    );
  }
}
