import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: amount,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500, color: titleOrangeColorL),
          ),
          TextSpan(
            text: " dt",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w400, color: titleOrangeColorL),
          )
        ],
      ),
    );
  }
}
