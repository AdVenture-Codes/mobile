import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/constants/sizes.dart';
import 'package:verse/src/features/core_2/screens/Profil_Pages/coupon_page.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../core/screens/profile/profile_screen.dart';
import '../../models/Coupons_model.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: Text(
                  "My Coupons",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 36
                          //fontWeight: FontWeight.w700,
                          ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              AnimatedPositioned(
                duration: panelTransition,
                child: Container(
                  height: size.height * 0.7,
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: 15),
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? backgroundColorBlack
                          : backgroundColorWhihe,
                      borderRadius: BorderRadius.circular(30)),
                  child: GridView.builder(
                      itemCount: coupons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2.7,
                        mainAxisSpacing: defaultPadding,
                        crossAxisSpacing: defaultPadding,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 500),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: CouponPage(
                                      coupon: coupons[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Flexible(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding),
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? Color(0xFF272727)
                                      : tCardBgColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(defaultPadding * 1.25),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Hero(
                                        tag: coupons[index].code!,
                                        child: Image.asset(tQrImage,
                                            fit: BoxFit.scaleDown,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2),
                                      ),
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          coupons[index].name!,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          coupons[index].vendor!,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
