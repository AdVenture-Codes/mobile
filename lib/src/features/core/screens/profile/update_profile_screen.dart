import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:verse/src/features/authentification/models/user_model.dart';
import 'package:verse/src/features/core/controllers/profile_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
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
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headline3),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserModel user = snapshot.data as UserModel;
                final email = TextEditingController(text: user.email);
                final password = TextEditingController(text: user.password);
                final fullName = TextEditingController(text: user.fullName);
                final phoneNum = TextEditingController(text: user.phoneNum);
                return Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                  image: AssetImage(tProfileImage))),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color:
                                  isDarkMode ? Color(0xFF272727) : tCardBgColor,
                            ),
                            child: Icon(
                              LineAwesomeIcons.camera,
                              size: 20,
                              color: isDarkMode ? twhiteColor : tDarkColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.07),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            //initialValue: user.fullName,
                            controller: fullName,
                            decoration: InputDecoration(
                              hintText: tFullNameSignup,
                              prefixIcon: Icon(Icons.person_outline_rounded),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            //initialValue: user.email,
                            controller: email,
                            decoration: InputDecoration(
                              hintText: tEmailSignup,
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            //initialValue: user.phoneNum,
                            controller: phoneNum,
                            decoration: InputDecoration(
                              hintText: tPhoneSignup,
                              prefixIcon: Icon(Icons.numbers),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            // initialValue: user.password,
                            controller: password,
                            decoration: InputDecoration(
                              hintText: tPasswordSignup,
                              prefixIcon: Icon(Icons.fingerprint),
                            ),
                          ),
                          SizedBox(height: size.height * 0.07),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final userM = UserModel(
                                  id: user.id,
                                  email: email.text.trim(),
                                  password: password.text.trim(),
                                  fullName: fullName.text.trim(),
                                  phoneNum: phoneNum.text.trim(),
                                );
                                controller.updateRecord(userM);
                                Get.back();
                              },
                              child: Text(tEditProfile),
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide.none,
                                  shape: StadiumBorder()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: tJoined,
                              style: TextStyle(fontSize: 12),
                              children: [
                                TextSpan(
                                  text: tJoinedAt,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ]),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: StadiumBorder(),
                                side: BorderSide.none),
                            child: Text(tDelete))
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                // Center(child: Text("Something went wrong"));
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
