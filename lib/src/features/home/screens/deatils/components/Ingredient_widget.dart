import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key, this.image, this.title});

  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var size = mediaQuery.size;
    return Column(
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: size.width * 0.07,
            child: Image(
              image: AssetImage(
                image!,
              ),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Text(title!, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
