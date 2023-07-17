import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/constants/images_string.dart';
import 'package:verse/src/features/core_2/controllers/coupon_controller.dart';
import '../../../../constants/colors.dart';
import '../../../core/screens/profile/profile_screen.dart';
import '../../models/Coupons_model.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key, this.coupon});

  final CouponModel? coupon;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    final controller = Get.put(couponController());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(right: 45),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
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
          Container(
            margin: const EdgeInsets.only(right: 10),
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
        ],
      ),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Expanded(
                      child: Hero(
                        tag: coupon!.code as String,
                        child: Image.asset(
                          tQrImage,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    "Name :",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 23),
                  ),
                  Spacer(),
                  Text(
                    "${coupon?.name}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 23),
                  ),
                  SizedBox(width: 20)
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    "Vendor :",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 23),
                  ),
                  Spacer(),
                  Text(
                    "${coupon?.vendor}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 23),
                  ),
                  SizedBox(width: 20)
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    "Code :",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 23),
                  ),
                  Spacer(),
                  Text(
                    "${coupon?.code}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                        color: Colors.red),
                  ),
                  SizedBox(width: 20)
                ],
              ),
            ),
            SizedBox(height: size.height * 0.12),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: size.height * 0.04,
                    color: Colors.red,
                  ),
                  Expanded(
                    child: Text(
                      "THIS COUPON CAN BE USED ONLY ONE TIME",
                      textAlign: TextAlign.center,
                      // overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ElevatedButton(
              onPressed: () async {
                final coupon = CouponModel(
                    id: "333", name: "gift", vendor: "zara", code: "1111");
                await controller.createCoupon(coupon);
              },
              child: Text("Go to Vendor"),
            ),
          ),
        ),
      ),
    );
  }
}
