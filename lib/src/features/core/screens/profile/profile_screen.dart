import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:verse/src/constants/images_string.dart';
import 'package:verse/src/constants/sizes.dart';
import 'package:verse/src/constants/text_string.dart';
import 'package:verse/src/features/core/screens/profile/profile_user_management.dart';
import 'package:verse/src/features/core/screens/profile/update_profile_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../repository/authentification_repository/authentification_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              LineAwesomeIcons.angle_left,
              color: isDarkMode ? twhiteColor : tDarkColor,
            )),
        title: Text(tProfile, style: Theme.of(context).textTheme.headline3),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                isDarkMode ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
                color: isDarkMode ? twhiteColor : tDarkColor,
              )),
        ],
      ),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                      ),
                      child: Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20,
                        color: isDarkMode ? twhiteColor : tDarkColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(tProfileHeading,
                  style: Theme.of(context).textTheme.headline4),
              Text(tProfileSubHeading,
                  style: Theme.of(context).textTheme.bodyText1),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(UpdateProfileScreen());
                  },
                  child: Text(tEditProfile),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide.none, shape: StadiumBorder()),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 10),
              ProfileMenuWidget(
                  title: tMenu1, icon: LineAwesomeIcons.cog, onPress: () {}),
              ProfileMenuWidget(
                  title: tMenu2, icon: LineAwesomeIcons.wallet, onPress: () {}),
              ProfileMenuWidget(
                  title: tMenu3,
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {
                    Get.to(ProfileUserManagement());
                  }),
              Divider(),
              SizedBox(height: 10),
              ProfileMenuWidget(
                  title: tMenu4, icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: tMenu5,
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    AuthenticationRepository.instance.logout();
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueAccent.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.blueAccent),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
