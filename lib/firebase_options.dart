// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBb0psrDfk8DR3UpSY_QBZprd1hLp6b7fI',
    appId: '1:488893091726:android:d67acde63dd90f2e641edf',
    messagingSenderId: '488893091726',
    projectId: 'verse-6ae16',
    storageBucket: 'verse-6ae16.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcR2nqrZN1Hvno0V_pxRXGqsI5YJhyEj8',
    appId: '1:488893091726:ios:7d5064cc7d87e4e1641edf',
    messagingSenderId: '488893091726',
    projectId: 'verse-6ae16',
    storageBucket: 'verse-6ae16.appspot.com',
    androidClientId: '488893091726-1u3hv7is8vkg6uqc4n8u9gbjghkumdbr.apps.googleusercontent.com',
    iosClientId: '488893091726-4p5bt0fri7dkr4gvbn8haaqnira8i112.apps.googleusercontent.com',
    iosBundleId: 'com.example.verse',
  );
}
