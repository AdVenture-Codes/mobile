import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:verse/src/repository/authentification_repository/authentification_repository.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../models/categories_model.dart';
import '../profile/profile_screen.dart';

class DashboadScreen extends StatelessWidget {
  const DashboadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    //var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    final txtTheme = Theme.of(context).textTheme;
    final list = DashboardCategoriesModel.list;
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            //For Dark Color
            color: isDarkMode ? twhiteColor : tDarkColor,
          ),
          title:
              Text("Adventure", style: Theme.of(context).textTheme.headline5),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //For Dark Color
                color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
              ),
              child: IconButton(
                  onPressed: () {
                    Get.to(() => const ProfileScreen());
                  },
                  icon: const Image(image: AssetImage(tUserProfileImage))),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text Title
                Text(tDashboardTitle, style: txtTheme.bodyText2),
                Text(tDashboardHeading, style: txtTheme.headline2),
                SizedBox(height: 20),
                //search Bar
                Container(
                  decoration: const BoxDecoration(
                      border: Border(left: BorderSide(width: 4))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(tDashboardsearch,
                          style: txtTheme.headline2
                              ?.apply(color: Colors.grey.withOpacity(0.5))),
                      const Icon(Icons.mic, size: 25),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //Category card
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: list[index].onPress,
                      child: SizedBox(
                        width: 170,
                        height: 45,
                        child: Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: tDarkColor),
                              child: Center(
                                child: Text(list[index].title,
                                    style: txtTheme.headline6
                                        ?.apply(color: Colors.white)),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(list[index].heading,
                                      style: txtTheme.headline6,
                                      overflow: TextOverflow.ellipsis),
                                  Text(list[index].subHeading,
                                      style: txtTheme.bodyText2,
                                      overflow: TextOverflow.ellipsis)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //Banner List
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //1st banner
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //For Dark Color
                          color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Flexible(
                                    child: Image(
                                  image: AssetImage(tBookmarkIcon),
                                  height: 25,
                                )),
                                Flexible(
                                    child: Image(
                                        image: AssetImage(tBannerImage1))),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Text(tDashboardBannerTitle1,
                                style: txtTheme.headline4,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            Text(tDashboardBannerSubTitle1,
                                style: txtTheme.bodyText2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    //2nd Banner
                    Expanded(
                      child: Column(
                        children: [
                          //Card
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //For Dark Color
                              color:
                                  isDarkMode ? Color(0xFF272727) : tCardBgColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(
                                        child: Image(
                                      image: AssetImage(tBookmarkIcon),
                                      height: 25,
                                    )),
                                    Flexible(
                                        child: Image(
                                            image: AssetImage(tBannerImage2))),
                                  ],
                                ),
                                Text(tDashboardBannerTitle2,
                                    style: txtTheme.headline4,
                                    overflow: TextOverflow.ellipsis),
                                Text(tDashboardBannerSubTitle1,
                                    style: txtTheme.bodyText2,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text(tDashboardButton)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //Top Courses
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: list[index].onPress,
                      child: SizedBox(
                        width: 320,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //For Dark Color
                              color:
                                  isDarkMode ? Color(0xFF272727) : tCardBgColor,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        list[index].title,
                                        style: txtTheme.headline4,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Flexible(
                                        child: Image(
                                            image: list[index].image.image,
                                            height: 90)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder()),
                                      onPressed: () {},
                                      child: const Icon(Icons.play_arrow),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index].heading,
                                          style: txtTheme.headline4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          list[index].subHeading,
                                          style: txtTheme.bodyText2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        AuthenticationRepository.instance
                                            .logout();
                                      },
                                      child: Text("logout")),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
