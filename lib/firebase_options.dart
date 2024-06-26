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
    apiKey: 'AIzaSyAw508_G5fGxpPG3hit5Bx8iz1yhoP_yQw',
    appId: '1:168246001887:web:60d6aa6a22e81e31a9a96a',
    messagingSenderId: '168246001887',
    projectId: 'task-trail-4012e',
    authDomain: 'task-trail-4012e.firebaseapp.com',
    storageBucket: 'task-trail-4012e.appspot.com',
    measurementId: 'G-5T4SYND84J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-dsS1aAxlSu1lUDnYzmoiFyk6ikXpMgs',
    appId: '1:168246001887:android:7a4396a990dd9ee2a9a96a',
    messagingSenderId: '168246001887',
    projectId: 'task-trail-4012e',
    storageBucket: 'task-trail-4012e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_RCAjTUqI1oUEonOdh0WzpVt85ZfmAhY',
    appId: '1:168246001887:ios:1dcd7093d70eb778a9a96a',
    messagingSenderId: '168246001887',
    projectId: 'task-trail-4012e',
    storageBucket: 'task-trail-4012e.appspot.com',
    iosBundleId: 'com.example.tasktrail',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_RCAjTUqI1oUEonOdh0WzpVt85ZfmAhY',
    appId: '1:168246001887:ios:126848b8289dd9dda9a96a',
    messagingSenderId: '168246001887',
    projectId: 'task-trail-4012e',
    storageBucket: 'task-trail-4012e.appspot.com',
    iosBundleId: 'com.example.tasktrail.RunnerTests',
  );
}
