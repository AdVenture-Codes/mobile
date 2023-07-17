import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:verse/src/features/authentification/models/user_model.dart';
import 'package:verse/src/features/authentification/screens/forget_password/forget_password_otp/otp_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../controllers/signup_controller.dart';
import '../sign_in/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    //final _formKey = GlobalKey<FormState>();
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  child: Image(
                    image: AssetImage(tSignUpImage),
                    height: size.height * 0.1,
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(height: size.height * 0.01),
                Text(tSignupTitle,
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(height: size.height * 0.01),
                Text(tSignupSubtitle,
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(height: size.height * 0.02),
                Container(
                  child: Form(
                    //key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.fullName,
                          decoration: InputDecoration(
                            hintText: tFullNameSignup,
                            prefixIcon: Icon(Icons.person_outline_rounded),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            hintText: tEmailSignup,
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: controller.phoneNum,
                          decoration: InputDecoration(
                            hintText: tPhoneSignup,
                            prefixIcon: Icon(Icons.numbers),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: controller.password,
                          decoration: InputDecoration(
                            hintText: tPasswordSignup,
                            prefixIcon: Icon(Icons.fingerprint),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text(tSignUp),
                            onPressed: () async {
                              //if (_formKey.currentState!.validate()) {
                              //SignUpController.instance.registerUser(controller.email.text.trim(),controller.password.text.trim());
                              // SignUpController.instance.phoneAuthentification(controller.phoneNum.text.trim());
                              // }
                              final user = UserModel(
                                email: controller.email.text.trim(),
                                password: controller.password.text.trim(),
                                fullName: controller.fullName.text.trim(),
                                phoneNum: controller.phoneNum.text.trim(),
                              );
                              SignUpController.instance.createUser(user);
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("OR"),
                            SizedBox(height: size.height * 0.005),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Image(
                                    height: size.height * 0.05,
                                    image: AssetImage(tFacebookImageIn),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    foregroundColor: tOutlineButtonTextColorD,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.05),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Image(
                                    height: size.height * 0.05,
                                    image: AssetImage(tGoogleImageIn),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    foregroundColor: tOutlineButtonTextColorD,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(SignInScreen());
                              },
                              child: Text.rich(
                                TextSpan(
                                    text: tAlreadyHaveAnAccount,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    children: [
                                      TextSpan(
                                          text: tSignIn,
                                          style: TextStyle(
                                              color: tElevateButtonTextColorD)),
                                    ]),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
