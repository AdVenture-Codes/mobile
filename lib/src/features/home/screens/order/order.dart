import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/features/home/screens/home/home_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../../constants/sizes.dart';
import '../../components/fav_btn.dart';
import '../../controllers/home_controller.dart';
import '../home/components/cart_detailsview_card.dart';
import '../home/components/product_card.dart';

class Order extends StatelessWidget {
  const Order({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      appBar: AppBar(
        leading: BackButton(
          color: isDarkMode ? twhiteColor : tDarkColor,
        ),
        backgroundColor:
            isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
        elevation: 0,
        centerTitle: true,
        title: Text("Gram Bistro",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w300)),
        actions: [
          FavBtn(radius: 20),
          SizedBox(width: defaultPadding),
        ],
      ),
      //appBar: AppBarDetails("Gram Bistro"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Your order status",
                    style: Theme.of(context).textTheme.headline6!),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: size.height * 0.3,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Expanded(
                        child: Image.asset(
                          tOrderImage1,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Column(
                        children: [
                          Text("Your order will be ready in ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                          SizedBox(height: 4),
                          Text("A few minutes ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 22,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Container(
                height: size.height * 0.4,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: [
                        Text("Order list and prices",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                        Container(
                          height: size.height * 0.27,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(
                                  controller.cart.length,
                                  (index) => CartDetailsViewCard(
                                      productItem: controller.cart[index]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(),
                        Row(
                          children: [
                            Text("Total price",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                            SizedBox(height: 4),
                            Spacer(),
                            Text(
                                "${controller.totalPriceItems().toStringAsFixed(3)} dt ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 18,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.009),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Finish'),
                        SizedBox(width: 8),
                        Icon(Icons.check),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarDetails extends StatelessWidget {
  AppBarDetails({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return AppBar(
      leading: BackButton(
        color: isDarkMode ? twhiteColor : tDarkColor,
      ),
      backgroundColor: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      elevation: 0,
      centerTitle: true,
      title: Text(title!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontSize: 20, fontWeight: FontWeight.w300)),
      actions: [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}
