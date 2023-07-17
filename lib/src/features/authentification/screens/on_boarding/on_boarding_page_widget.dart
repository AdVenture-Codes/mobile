import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';

class onBoardingPageWidget extends StatelessWidget {
  const onBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.all(tDefaultSize),
        color: model.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: AssetImage(model.image),
              height: size.height * 0.5,
            ),
            Column(
              children: [
                Text(
                  model.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  model.subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: size.height * 0.2),
              ],
            ),
          ],
        ));
  }
}
