import 'dart:ffi';

import 'Product.dart';

class ProductItem {
  int quantity;
  double? totalItem;
  final Product? product;
  // static Double? tt;

  ProductItem({this.quantity = 1, totalItem, required this.product})
      : this.totalItem = product!.price!;

  void increment() {
    quantity++;
  }

  void incrementPrice() {
    totalItem = (totalItem! + product!.price!.toDouble());
  }

  // void add() {}

  // void substract() {}
}
