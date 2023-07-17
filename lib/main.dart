import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verse/src/features/authentification/screens/splash/splash_screen.dart';
import 'package:verse/src/features/core/screens/setLocation/set_location.dart';
import 'package:verse/src/features/core_2/screens/homeScreen2.dart';
import 'package:verse/src/features/home/screens/home/home_screen.dart';

import 'package:verse/src/repository/authentification_repository/authentification_repository.dart';
import 'package:verse/src/utils/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      //defaultTransition: Transition.leftToRightWithFade,
      //transitionDuration: const Duration(milliseconds: 500),
      home: const CircularProgressIndicator(),
      // home: SplashScreen(),
      //home: WelcomeScreen(),
      //home: SetLocation(),
      //home: HomeScreen(),
      //home: HomeScreen2Page(),
      //home: HomeScreen2(),
    );
  }
}
