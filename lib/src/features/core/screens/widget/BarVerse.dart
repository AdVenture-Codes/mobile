import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:verse/src/features/home/screens/marketplace/marketplace.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../profile/profile_screen.dart';

AppBar BarVerse(BuildContext context) {
  var mediaQuery = MediaQuery.of(context);
  var brightness = mediaQuery.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;
  var size = mediaQuery.size;
  return AppBar(
    leadingWidth: 100,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    leading: Container(
      margin: const EdgeInsets.only(right: 25),
      child: IconButton(
        onPressed: () {
          Get.to(() => const ProfileScreen());
        },
        icon: Icon(
          Icons.menu,
          size: size.height * 0.04,
          color: isDarkMode ? twhiteColor : tDarkColor,
        ),
      ),
    ),
    title: Container(
      child: Image(
        image: AssetImage(tLogoVerse),
        width: size.height * 0.12,
      ),
    ),
    actions: [
      /* Container(
        margin: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () {
            Get.to(() => MarketPlace());
          },
          icon: Icon(
            Icons.shopping_bag_rounded,
            size: size.height * 0.038,
            color: isDarkMode ? twhiteColor : tDarkColor,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 20, top: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //For Dark Color
          color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
        ),
        child: IconButton(
            onPressed: () {
              //Get.to(() => const ProfileScreen());
            },
            icon: const Image(image: AssetImage(tUserProfileImage))),
      ),*/
    ],
  );
}
