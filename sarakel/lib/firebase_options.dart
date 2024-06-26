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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDC4_03h716SWY5iSncgEJCM18_R1bb6kA',
    appId: '1:74358882817:web:af81adb71413daa871b600',
    messagingSenderId: '74358882817',
    projectId: 'final-sarakel',
    authDomain: 'final-sarakel.firebaseapp.com',
    storageBucket: 'final-sarakel.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrDSDbs3mSoRDxyU7Hs847y8tucbr9pFI',
    appId: '1:74358882817:android:59ec22b0bcc2fe5471b600',
    messagingSenderId: '74358882817',
    projectId: 'final-sarakel',
    storageBucket: 'final-sarakel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxozMWFPDwjmkFmXPwUzSxYh-SkOZ9NOo',
    appId: '1:74358882817:ios:335bea256c20247371b600',
    messagingSenderId: '74358882817',
    projectId: 'final-sarakel',
    storageBucket: 'final-sarakel.appspot.com',
    iosClientId:
        '74358882817-09dhvq9okbd0pi69kgrv11oovb864fdn.apps.googleusercontent.com',
    iosBundleId: 'com.example.sarakel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxozMWFPDwjmkFmXPwUzSxYh-SkOZ9NOo',
    appId: '1:74358882817:ios:6af50ec1f402238371b600',
    messagingSenderId: '74358882817',
    projectId: 'final-sarakel',
    storageBucket: 'final-sarakel.appspot.com',
    iosClientId:
        '74358882817-e78fa6krffcnib2ubtg6na5s651cvhjt.apps.googleusercontent.com',
    iosBundleId: 'com.example.sarakel.RunnerTests',
  );
}
