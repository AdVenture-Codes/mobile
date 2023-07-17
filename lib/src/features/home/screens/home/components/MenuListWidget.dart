import 'package:flutter/cupertino.dart';
import 'package:verse/src/features/home/screens/home/components/product_card.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/home_controller.dart';
import '../../deatils/details_screen.dart';

class MenuListWidget extends StatelessWidget {
  const MenuListWidget(
      {super.key,
      required this.controller,
      required this.constraints,
      required this.product});

  final HomeController controller;
  final BoxConstraints constraints;
  final List product;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return AnimatedPositioned(
      duration: panelTransition,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: 15),
        decoration: BoxDecoration(
          color: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(defaultPadding * 1.5),
            bottomRight: Radius.circular(defaultPadding * 1.5),
          ),
        ),
        child: GridView.builder(
          itemCount: product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.7,
            mainAxisSpacing: defaultPadding,
            crossAxisSpacing: defaultPadding,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: product[index],
            press: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      FadeTransition(
                    opacity: animation,
                    child: DetailsScreen(
                      product: product[index],
                      onProductAdd: () {
                        controller.addProductToCart(product[index]);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
