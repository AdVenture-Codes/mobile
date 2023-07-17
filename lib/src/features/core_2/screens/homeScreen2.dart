import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:verse/src/constants/colors.dart';
import 'package:verse/src/features/core_2/screens/Profil_Pages/profil.dart';
import '../../core/screens/widget/BarVerse.dart';
import 'Home_pages/marketplace.dart';
import 'QR_pages/qr_camera.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int index = 2;
  final items = [
    Icon(Icons.qr_code_2, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.person, size: 30)
  ];
  final screens = [QrCamera(), MarketPlace(), Profil()];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
            appBar: index == 1 ? null : BarVerse(context),
            backgroundColor:
                isDarkMode ? backgroundColorBlack : backgroundColorWhihe,
            //extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: isDarkMode ? Color(0xFF272727) : tCardBgColor,
              items: items,
              index: index,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 500),
              height: 50,
              onTap: (index) => setState(() {
                this.index = index;
              }),
            ),
            body: screens[index]),
      ),
    );
  }
}
