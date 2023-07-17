import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Full contactlessa experience",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: titleOrangeColorL)),
          Text("Full contactlessa experience",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: titleBlackColorL)),
          SizedBox(height: 20),
          Text(
            "Full contactlessa experience",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          Text(
            "Full contactlessa experience",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 20),
          Text(
            "Full contactlessa experience",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Full contactlessa experience",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
