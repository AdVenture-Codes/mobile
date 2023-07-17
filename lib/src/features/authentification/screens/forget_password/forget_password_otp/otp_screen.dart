import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:verse/src/features/authentification/controllers/otp_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    var otp;
    var otpController = Get.put(OTPController());
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.15),
                Text(
                  tOTPTitle,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 80.0),
                ),
                SizedBox(height: size.height * 0.01),
                Text(tOTPSubTitle.toUpperCase(),
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: size.height * 0.03),
                const Text("$tOTPMessage support@codingwitht.com",
                    textAlign: TextAlign.center),
                SizedBox(height: size.height * 0.05),
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  spaceBetween: 10,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.center,
                  fieldStyle: FieldStyle.box,
                  keyboardType: TextInputType.number,
                  onCompleted: (code) {
                    otp = code;
                    OTPController.instance.verifyOTP(otp);
                  },
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        OTPController.instance.verifyOTP(otp);
                      },
                      child: const Text(tNext)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
