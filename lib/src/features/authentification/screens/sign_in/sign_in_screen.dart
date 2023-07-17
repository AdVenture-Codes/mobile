import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../sign_up/sign_up_screen.dart';
import 'login_form_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(tSignInImage),
                    height: size.height * 0.23,
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(height: size.height * 0.01),
                Text(tLoginTitle, style: Theme.of(context).textTheme.headline2),
                SizedBox(height: size.height * 0.01),
                Text(tLoginSubtitle,
                    style: Theme.of(context).textTheme.bodyText1),
                LoginForm(),
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
                                borderRadius: BorderRadius.circular(100)),
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
                                borderRadius: BorderRadius.circular(100)),
                            foregroundColor: tOutlineButtonTextColorD,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpScreen());
                      },
                      child: Text.rich(
                        TextSpan(
                            text: tDontHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                  text: tSignUp,
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
        ),
      ),
    );
  }
}
