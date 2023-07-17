import 'package:flutter/material.dart';
import 'package:verse/src/constants/images_string.dart';
import 'package:verse/src/constants/sizes.dart';
import 'package:verse/src/features/home/components/fav_btn.dart';
import 'package:verse/src/features/home/components/price.dart';
import '../../../../../constants/colors.dart';
import '../../../models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: press,
      child: Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
            color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultPadding * 1.25),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Hero(
                  tag: product.title!,
                  child: Image.asset(
                    product.image!,
                    fit: BoxFit.scaleDown,
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.title!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(tStar),
                            Text(
                              product.star!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          product.reviews!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Price(amount: product.price!.toString()),
                        FavBtn(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
