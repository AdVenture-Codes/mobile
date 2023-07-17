import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/features/home/screens/home/home_screen.dart';
import 'package:verse/src/features/home/screens/order/order.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/home_controller.dart';
import '../../../models/ProductItem.dart';
import 'cart_detailsview_card.dart';
import 'cart_short_view.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your order", style: Theme.of(context).textTheme.headline6),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsViewCard(productItem: controller.cart[index]),
          ),
          SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(Order(controller: controller));
                // print("prix=${ProductItem.tt}");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Send order'),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
