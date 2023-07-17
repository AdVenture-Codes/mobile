import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPress,
  });

  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.3,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            SizedBox(height: size.height * 0.015),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 22,
                  ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
