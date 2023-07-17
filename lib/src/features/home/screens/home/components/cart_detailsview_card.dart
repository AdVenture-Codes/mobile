import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../components/price.dart';
import '../../../models/ProductItem.dart';

class CartDetailsViewCard extends StatelessWidget {
  const CartDetailsViewCard({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      leading: Expanded(
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Image(
            image: AssetImage(
              productItem.product!.image!,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      title: Text(
        productItem.product!.title!,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: "${productItem.totalItem}"),
            Text(
              "  x ${productItem.quantity}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
