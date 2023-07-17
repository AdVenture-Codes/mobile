import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/images_string.dart';
import '../../../../../constants/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return Container(
      height: headerHeight,
      color: isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    IconData(0xe3ab, fontFamily: 'MaterialIcons'),
                    color: Color(0xff8E8EA9),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Gram Bistro",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  // SizedBox(width: 20),
                  Text(
                    "We think you might enjoy \n these special dishes",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 26),
                  ),
                ],
              )
              /* Text(
                "Good Morning!",
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                "Caesar Rincon",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black54),
              )*/
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            //backgroundImage: AssetImage("assets/images/profile.png"),
          )
        ],
      ),
    );
  }
}
