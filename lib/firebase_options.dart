// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmdHbiTCwEK3RnyryqFpayF4RBtPSkdoo',
    appId: '1:115678383346:web:8fb736ff19521c79b6946b',
    messagingSenderId: '115678383346',
    projectId: 'boring-counter',
    authDomain: 'boring-counter.firebaseapp.com',
    storageBucket: 'boring-counter.appspot.com',
    measurementId: 'G-1WNDFM4CYQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLlOPCFyKGLQe2tB-E9iUIWMlT0ShHR68',
    appId: '1:115678383346:android:7627026ca6683926b6946b',
    messagingSenderId: '115678383346',
    projectId: 'boring-counter',
    storageBucket: 'boring-counter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQX_RiZRPB-bWaFJgaXLQX3PYNbl_QJJs',
    appId: '1:115678383346:ios:7c28dc858b8071e1b6946b',
    messagingSenderId: '115678383346',
    projectId: 'boring-counter',
    storageBucket: 'boring-counter.appspot.com',
    iosClientId:
        '115678383346-gki7if00j32kvlv040r7crhej28m0q5v.apps.googleusercontent.com',
    iosBundleId: 'com.example.softwarehut.flutter.boring-counter',
  );
}
