import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:verse/src/features/home/screens/home/home_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../Menu/list_menu.dart';
import '../widget/BarVerse.dart';

class UseCurrentLocation extends StatefulWidget {
  const UseCurrentLocation({super.key});

  @override
  State<UseCurrentLocation> createState() => _UseCurrentLocationState();
}

class _UseCurrentLocationState extends State<UseCurrentLocation> {
  String gender = "";

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: BarVerse(context),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Text(
                tTitleUseCurrentLocation,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 25,
                    ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                tSubtitleUseCurrentLocation,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                height: size.height * 0.45,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      current_location_widget(tTitleWidget1UseCurrentLocation,
                          tSubtitleWidget1UseCurrentLocation, context),
                      SizedBox(height: size.height * 0.03),
                      current_location_widget(tTitleWidget2UseCurrentLocation,
                          tSubtitleWidget2UseCurrentLocation, context),
                      SizedBox(height: size.height * 0.03),
                      current_location_widget(tTitleWidget3UseCurrentLocation,
                          tSubtitleWidget3UseCurrentLocation, context),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //Get.to(UseCurrentLocation());
                    navigator?.push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text("Continue"),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none, shape: StadiumBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector current_location_widget(
      String title, String subtitle, BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        setState(() {
          gender = title;
        });
      },
      child: Container(
        height: size.height * 0.12,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 22,
                      ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(),
                ),
              ],
            ),
            Radio(
              activeColor: Colors.red,
              value: title,
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
