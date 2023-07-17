import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/images_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgrtPasswordMailScreen extends StatelessWidget {
  const ForgrtPasswordMailScreen({super.key});

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
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1),
                  Align(
                    child: Image(
                      image: AssetImage(tForgetPasswordImage),
                      height: size.height * 0.25,
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(tForgetMailTitle,
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(height: size.height * 0.01),
                  Text(tForgetMailSubTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: tEmailForget,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(OTPScreen());
                        },
                        child: Text(tNext)),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
