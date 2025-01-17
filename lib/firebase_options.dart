// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDcj1H3iswmZ25UOwotiLzBn3K8dx2vKz8',
    appId: '1:770186065303:web:e34a6e7fb4470482de00d2',
    messagingSenderId: '770186065303',
    projectId: 'attendance-management-sy-2d26c',
    authDomain: 'attendance-management-sy-2d26c.firebaseapp.com',
    storageBucket: 'attendance-management-sy-2d26c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARGiGisqu4cnCHinAvXhaXLgKs7LNdCMQ',
    appId: '1:770186065303:android:003b5692e52af3c1de00d2',
    messagingSenderId: '770186065303',
    projectId: 'attendance-management-sy-2d26c',
    storageBucket: 'attendance-management-sy-2d26c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4QQp5QeV0Rw84o7kRg1ygPUABdZGQFwc',
    appId: '1:770186065303:ios:50063e1bee63937dde00d2',
    messagingSenderId: '770186065303',
    projectId: 'attendance-management-sy-2d26c',
    storageBucket: 'attendance-management-sy-2d26c.appspot.com',
    iosBundleId: 'com.example.attendanceManagementSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4QQp5QeV0Rw84o7kRg1ygPUABdZGQFwc',
    appId: '1:770186065303:ios:50063e1bee63937dde00d2',
    messagingSenderId: '770186065303',
    projectId: 'attendance-management-sy-2d26c',
    storageBucket: 'attendance-management-sy-2d26c.appspot.com',
    iosBundleId: 'com.example.attendanceManagementSystem',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDcj1H3iswmZ25UOwotiLzBn3K8dx2vKz8',
    appId: '1:770186065303:web:04fadbb0b312f69bde00d2',
    messagingSenderId: '770186065303',
    projectId: 'attendance-management-sy-2d26c',
    authDomain: 'attendance-management-sy-2d26c.firebaseapp.com',
    storageBucket: 'attendance-management-sy-2d26c.appspot.com',
  );
}
